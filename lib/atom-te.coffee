{CompositeDisposable} = require 'atom'
ChildProcess = require 'child_process'

module.exports = AtomTe =
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-te:runLine': => @runLine()

  deactivate: ->
    @subscriptions.dispose()

  runLine: ->
    editor = atom.workspace.getActiveEditor()
    return unless editor?

    cursor = editor.getCursor()
    line = cursor.getBufferRow() + 1
    @run(editor.getPath(), line)

  run: (file, line) ->
    spawn = ChildProcess.spawn
    testCommand = "te run"
    command = "#{testCommand} #{file}:#{line}"
    console.log "[Te] running: #{command}"
    terminal = spawn("bash", ["-l"])

    terminal.stdin.write("cd #{@projectRoot()} && #{command}\n")
    terminal.stdin.write("exit\n")

  projectRoot: ->
    atom.project.getRootDirectory().getPath()
