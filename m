Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:45972 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750922AbeEUI7X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 04:59:23 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?ISO-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 1/2] vsp-lib: Capture the kernel log messages in test log files
Date: Mon, 21 May 2018 11:59:48 +0300
Message-ID: <1663055.khoy9BkJL7@avalon>
In-Reply-To: <20180520104753.GA5115@bigcity.dyn.berto.se>
References: <20180519203426.25711-1-laurent.pinchart@ideasonboard.com> <20180519203426.25711-2-laurent.pinchart@ideasonboard.com> <20180520104753.GA5115@bigcity.dyn.berto.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Sunday, 20 May 2018 13:47:53 EEST Niklas S=F6derlund wrote:
> On 2018-05-19 23:34:25 +0300, Laurent Pinchart wrote:
> > It can be useful to capture kernel log messages in test log files for
> > diagnostic purpose. Add a simple mechanism to do so by capturing the
> > full kernel log at the end of the test. The kernel log is cleared first
> > before starting the test to avoid capturing unrelated messages.
> >=20
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >=20
> >  scripts/vsp-lib.sh | 5 +++++
> >  1 file changed, 5 insertions(+)
> >=20
> > diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> > index 0f3992a7827e..e672686a377e 100755
> > --- a/scripts/vsp-lib.sh
> > +++ b/scripts/vsp-lib.sh
> > @@ -1075,6 +1075,9 @@ test_init() {
> >=20
> >  	echo "Using device $mdev ($dev)" | ./logger.sh config >> $logfile
> >  =09
> >  	vsp_runner=3D./vsp-runner.sh
> >=20
> > +
> > +	# Clear the kernel log
> > +	dmesg -c > /dev/null
>=20
> I agree it's useful to capture the kernel log messages during a test, I
> did the same thing in vin-tests. What I did learn was that when
> something do go wrong you kind of want the whole kernel log from boot
> and truncating it could be annoying. Just the other day I got feed up
> with this in vin-tests and found a different way, as it's still fresh in
> my memory maybe it could be useful for you too, or not :-)
>=20
>     marker=3D$(dmesg | tail -n 1 | sed 's/^\[\([^]]*\)\].*/\1/g')
>=20
> >  }
> > =20
> >  test_start() {
> >=20
> > @@ -1086,6 +1089,8 @@ test_complete() {
> >=20
> >  	echo "Done: $1" | ./logger.sh >> $logfile
> >  	echo $1 >&2
> >=20
> > +	dmesg -c | ./logger.sh kernel >> $logfile
> > +
>=20
>         dmesg | sed "1,/$marker/d" | ./logger.sh kernel >> $logfile

That's a good idea. I gave it a try and it worked, I'll send a v2.

> >  	rm -f ${frames_dir}frame-*.bin
> >  	rm -f ${frames_dir}histo-*.bin
> >  	rm -f ${frames_dir}rpf.*.bin

=2D-=20
Regards,

Laurent Pinchart
