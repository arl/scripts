# ipython bug inside virtualenv

This fixes the problem, which is explained into more details
[here](https://github.com/ipython/ipython/issues/13554):

    sed -i 's/p.readlink()/p._from_parts(os.readlink(p,))/g' .venv/lib/python3.8/site-packages/IPython/core/interactiveshell.py
