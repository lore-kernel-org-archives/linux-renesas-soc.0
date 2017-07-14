Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 14 Jul 2017 15:05:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, devel@driverdev.osuosl.org,
        Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        adi-buildroot-devel@lists.sourceforge.net,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Tejun Heo <tj@kernel.org>, akpm@linux-foundation.org,
        Alan Cox <alan@linux.intel.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Daeseok Youn <daeseok.youn@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org
Subject: Re: [PATCH 14/14] [media] fix warning on v4l2_subdev_call() result
 interpreted as bool
Message-ID: <20170714120512.ioe67nnloqivtbr7@mwanda>
References: <20170714092540.1217397-1-arnd@arndb.de>
 <20170714093938.1469319-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170714093938.1469319-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Changing:

- if (!frob()) {
+ if (frob() == 0) {

is a totally pointless change.  They're both bad, because they're doing
success testing instead of failure testing, but probably the second one
is slightly worse.

This warning seems dumb.  I can't imagine it has even a 10% success rate
at finding real bugs.  Just disable it.

Changing the code to propagate error codes, is the right thing of course
so long as it doesn't introduce bugs.

regards,
dan carpenter
