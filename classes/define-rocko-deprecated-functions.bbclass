
# Define deprecated 'rocko' poky methods to avoid any
# warnings/errors at build time, due to upgrading to sumo.
def oe_filter_out(f, str, d):
    from oe import utils
    return oe.utils.str_filter_out(f, str, d)
