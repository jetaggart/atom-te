{CompositeDisposable} = require 'atom'
ChildProcess = require 'child_process'

module.exports = AtomTe =
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-te:runAll': => @runAll()
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-te:runLine': => @runLine()
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-te:runFile': => @runFile()
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-te:runLast': => @runLast()

  deactivate: ->
    @subscriptions.dispose()

  currentFile: ->
    editor = atom.workspace.getActiveEditor()
    return unless editor?

    editor.getPath()

  saveAll: ->
    for paneItem in atom.workspace.getPaneItems()
      if paneItem.getURI?()? and paneItem.isModified?()
        paneItem.save()

  runAll: ->
    @run("")

  runFile: ->
    @run(@currentFile())

  runLine: ->
    editor = atom.workspace.getActiveEditor()

    line = editor.getCursor().getBufferRow() + 1
    @run("#{@currentFile()}:#{line}")

  runLast: ->
    @exec("run-last")

  run: (args) ->
    @exec "run #{args}"

  exec: (command) ->
    @saveAll()
    
    spawn = ChildProcess.spawn

    terminal = spawn("bash", ["-l"])

    console.log "te #{command}"

    terminal.stdin.write("cd #{@projectRoot()} && te #{command}\n")
    terminal.stdin.write("exit\n")


  projectRoot: ->
    atom.project.getRootDirectory().getPath()
