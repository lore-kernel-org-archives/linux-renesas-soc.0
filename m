Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:51066 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750831AbdAPPeZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Jan 2017 10:34:25 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?B?44Kr44Kq44O744O044Kh44Oz44O744OJ44Oz?=
        <cv-dong@jinso.co.jp>
Cc: Wolfram Sang <wsa@sang-engineering.com>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?utf-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?utf-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Cao Minh Hiep <cm-hiep@jinso.co.jp>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        na-hoan@jinso.co.jp
Subject: Re: The failure summary report of GEN2 for linux stable v4.10-rc2
Date: Mon, 16 Jan 2017 17:34:38 +0200
Message-ID: <1541680.74X8BDbpjb@avalon>
In-Reply-To: <1484558970996626000058af@nat.cybozu.com>
References: <1484558970996626000058af@nat.cybozu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Dong,

On Monday 16 Jan 2017 18:29:30 =E3=82=AB=E3=82=AA=E3=83=BB=E3=83=B4=E3=82=
=A1=E3=83=B3=E3=83=BB=E3=83=89=E3=83=B3 wrote:
> Hi all,
>=20
> We have tested the linux v4.10-rc2 for Gen2 Lager and Koelsch
>=20
> So we would like to report the summary of the failure.

Thank you for the report.

I've retested the HDMI output on Lager running v4.10-rc2 with=20
shmobile_defconfig using your test method (with the bmap application) a=
nd I=20
haven't been to reproduce the problem. I have also tested v4.8 and v4.9=
, and=20
both worked fine as well.

The kernel was started with the HDMI cable unplugged in all tests. If I=
 boot=20
the board with the cable plugged in, framebuffer allocation fails due t=
o CMA=20
being disabled. Enabling CMA makes the test pass on all three kernels, =
both=20
with the HDMI cable plugged at boot and plugged after boot.

If you can still reproduce the problem on your side, could you please p=
rovide=20
me with a very detailed test procedure (including the kernel .config an=
d any=20
test application or data you're using) ?

--=20
Regards,

Laurent Pinchart
