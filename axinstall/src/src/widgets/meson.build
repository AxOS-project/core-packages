pkgdatadir = join_paths(get_option('prefix'), get_option('datadir'), meson.project_name())
widgetsdir = join_paths(pkgdatadir, 'axinstall/widgets')

axinstall_sources = [
    '__init__.py',
    'timezone.py',
    'layout.py',
    'variant.py',
    'desktop.py',
    'disk.py',
    'partition.py'
]
install_data(axinstall_sources, install_dir: widgetsdir)