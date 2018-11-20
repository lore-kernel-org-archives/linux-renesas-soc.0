Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1410137.outbound.protection.outlook.com ([40.107.141.137]:62688
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725900AbeKUKAK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 05:00:10 -0500
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jiada Wang <jiada_wang@mentor.com>
CC: Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/4] arm64: renesas: ulcb-kf: add pcm3168 sound codec
Date: Tue, 20 Nov 2018 23:28:23 +0000
Message-ID: <8736rv2v8d.wl-kuninori.morimoto.gx@renesas.com>
References: <87in18e3um.wl-kuninori.morimoto.gx@renesas.com>
        <87bm70e3rc.wl-kuninori.morimoto.gx@renesas.com>
        <12136bb6-d0af-bdb8-f288-345c733499d7@mentor.com>
        <b06ac026-d9a5-9537-a92b-77d0662ee9f5@mentor.com>
In-Reply-To: <b06ac026-d9a5-9537-a92b-77d0662ee9f5@mentor.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B9610CCF02E7B44DB274FD93F893F3D1@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Hi Jiada

> >> +
> >> +=A0=A0=A0 clk8snd: clk8snd {
> >> +=A0=A0=A0=A0=A0=A0=A0 compatible =3D "fixed-clock";
> >> +=A0=A0=A0=A0=A0=A0=A0 #clock-cells =3D <0>;
> >> +=A0=A0=A0=A0=A0=A0=A0 clock-frequency =3D <24576000>;
> >> +=A0=A0=A0 };
> > This is the same clock as cs2000, why not directly refer to &cs2000
> > from clksndsel,
> > otherwise, if snd_soc_rcar is loaded after snd_soc_pcm3168a_i2c,
> > load of snd_soc_pcm3168a_i2c fails with
> > "[=A0=A0=A0 8.412356] pcm3168a 15-0044: Failed to reset device: -6"
> > and sound cards can not be created
> >=20
>=20
> Could you let me know your thoughts on this?

Thank you for pointing it.
I will fix it in v2

Best regards
---
Kuninori Morimoto
