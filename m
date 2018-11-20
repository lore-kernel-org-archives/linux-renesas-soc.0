Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1400093.outbound.protection.outlook.com ([40.107.140.93]:20424
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730331AbeKTLd0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Nov 2018 06:33:26 -0500
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Simon Horman <horms@verge.net.au>
CC: Magnus <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Jiada Wang <jiada_wang@mentor.com>
Subject: Re: [PATCH 0/4] arm64: renesas: enable ULCB HDMI / ULCB-KF sound
Date: Tue, 20 Nov 2018 01:06:54 +0000
Message-ID: <871s7g4lbt.wl-kuninori.morimoto.gx@renesas.com>
References: <87in18e3um.wl-kuninori.morimoto.gx@renesas.com>
        <20181108104856.4ghuq6tytu6qwli3@verge.net.au>
        <875zx7kty8.wl-kuninori.morimoto.gx@renesas.com>
        <20181109094706.vinpd6h27yurehsb@verge.net.au>
        <20181119101510.jjzahay25f6ts7dk@verge.net.au>
In-Reply-To: <20181119101510.jjzahay25f6ts7dk@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9E91B9D2C419304EA9C9825A38C741CA@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Hi Simon

sorry for my late response

> > > It will be v4.21, not for v4.20.
> >=20
> > Are the dependencies present in v4.21-rc1?
> > If so perhaps we could apply this series as
> > my branches are currently based on v4.21-rc1.
> >=20
> > Let me know what you think.
>=20
> Hi Morimoto-san,
>=20
> could you let me know your thoughts on this?

Does your branches are based on v4.21-rc1 ? not v4.20-rc1 ?
The necessary patch is not yet included on v4.20-rc1.
But will be OK on v4.21-rc1

I will re-post it if linus/master branch includes
necessary commit.
