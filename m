Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>
CC: "mattw@codeaurora.org" <mattw@codeaurora.org>,
        "mitchelh@codeaurora.org" <mitchelh@codeaurora.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH 2/2] regmap: Avoid namespace collision within macro
Date: Thu, 27 Oct 2016 10:22:01 +0000
Message-ID: <SG2PR06MB1038CE3B1E2B231A223E5D06C3AA0@SG2PR06MB1038.apcprd06.prod.outlook.com>
References: <1477560799-58896-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <1477560799-58896-3-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <20161027101545.GH25322@sirena.org.uk>
In-Reply-To: <20161027101545.GH25322@sirena.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

> On Thu, Oct 27, 2016 at 10:33:19AM +0100, Ramesh Shanmugasundaram wrote:
>=20
> >  #define regmap_read_poll_timeout(map, addr, val, cond, sleep_us,
> > timeout_us) \  ({ \
> > -	ktime_t timeout =3D ktime_add_us(ktime_get(), timeout_us); \
> > +	ktime_t __timeout =3D ktime_add_us(ktime_get(), timeout_us); \
> >  	int ret; \
>=20
> Why is timeout an issue and not ret?

It is! However, it is less likely for someone to use "ret" as a variable na=
me for the given parameter list. Hence, I fixed timeout alone. Feel free to=
 fix "ret" as well.=20

Thanks,
Ramesh
