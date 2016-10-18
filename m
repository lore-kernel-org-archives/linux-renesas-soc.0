Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:59489 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754973AbcJRONg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 10:13:36 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xuan Truong Nguyen <nx-truong@jinso.co.jp>
Cc: duclm <lm-duc@jinso.co.jp>, ryusuke.sakato.bx@renesas.com,
        kuninori.morimoto.gx@renesas.com, magnus.damm@gmail.com,
        geert+renesas@glider.be, h-inayoshi@jinso.co.jp,
        yoshihiro.shimoda.uh@renesas.com, nv-dung@jinso.co.jp,
        cm-hiep@jinso.co.jp, laurent.pinchart+renesas@ideasonboard.com,
        horms+renesas@verge.net.au, linux-renesas-soc@vger.kernel.org,
        wsa@sang-engineering.com
Subject: Re: The failure summary report of GEN2 for linux stable v4.8
Date: Tue, 18 Oct 2016 17:13:32 +0300
Message-ID: <1557504.I3EyWl6QE0@avalon>
In-Reply-To: <9d9a647b-d75f-e89a-2d4d-55e409ccabae@jinso.co.jp>
References: <57A46D20.7040106@jinso.co.jp> <f2bb791e-8973-10a9-a2ac-1a944b38d4ad@jinso.co.jp> <9d9a647b-d75f-e89a-2d4d-55e409ccabae@jinso.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Truong,

On Tuesday 18 Oct 2016 19:06:52 Xuan Truong Nguyen wrote:
> Hi all,
>=20
> We have tested the linux stable v4.8 for Gen2 Koelsch and Lager

The document mentions that you have used shmobile_defconfig. However, t=
hat=20
configuration in v4.8 doesn't enable CONFIG_CMA, which causes at least =
the DU=20
driver to fail probing the device. I thus assume you have modified the=20=

configuration to enable CMA. The fact that shmobile_defconfig doesn't i=
nclude=20
the uvcvideo driver used by test 14 seems to confirm local modification=
s to=20
the configuration.

It would be useful to attach the kernel .config file to future reports =
to help=20
reproducing the test failures with the exact same configuration.

By the way, while at it, your e-mails are filtered out by the vger.kern=
el.org=20
server as they contain HTML. If you could send future reports without H=
TML it=20
would help them reaching the mailing list archive (although the presenc=
e of an=20
attachment might not be appreciated by vger.kernel.org, I'm not sure ab=
out=20
that).

> So we would like to report the summary of the failure.

Issue 8 ("Lager: bad image quality when shown on HDMI display") can't b=
e=20
reproduced on my system when displaying a test pattern with the modetes=
t=20
application. Could you please share more information on how to reproduc=
e the=20
problem ?

Issue 11 ("VSP1=EF=BC=9Aerror message appears on initilization") has be=
en introduced=20
in

commit 94fcdf829793b141dc93e20a2bbd9eeaa44ea25f
Author: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Date:   Thu Feb 11 22:49:14 2016 -0200

    [media] v4l: vsp1: Add FCP support

and fixed in

commit fd44aa9a254b18176ec3792a18e7de6977030ca8
Author: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Date:   Wed Aug 17 09:57:37 2016 -0300

    [media] v4l: rcar-fcp: Don't force users to check for disabled FCP =
support

The fix is available in v4.9-rc1. I've also submitted it for inclusion =
in the=20
v4.8 stable series.

Issue 14 ("USB-CAM: Warning message appears if remove the usb-camera ca=
ble=20
under using") is likely not a Renesas-specific problem, but as I'm the=20=

maintainer of the uvcvideo webcam driver you used for testing I'll inve=
stigate=20
that.

--=20
Regards,

Laurent Pinchart
