c.TerminalInteractiveShell.editing_mode = 'vi'
c.TerminalIPythonApp.extensions = ['line_profiler', 'autoreload']
c.TerminalIPythonApp.exec_lines = ['%autoreload 2']
c.TerminalIPythonApp.exec_lines.append('print("Warning: disable autoreload in ipython_config.py to improve performance".)')
