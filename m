Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FC135DA6B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 10:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774001969; cv=none; b=Nyg3vZgab8PfH8GJd5IjyS6F+u32MPPY01m2hh5SQ6rngoiGzIxaa/D4DoGVySVjSSrqllckn3wzP7dwpcKg8Xd34rWqZBuZvVcfA0fSy6d5nCkubahW/KrD61X85h6iyshpjjgDuNJ3j0b7Hh0pJxaxXvZRf3PWEih7OuuwMaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774001969; c=relaxed/simple;
	bh=HBPmMGasIyRoFIIGWUvevcm1Z9zcACiuNYhirAkn1Hc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nv5vZ2C0Y+NQnU3reV4Lwk1YzNgRGtI/jFD3iVWgmooIzZPfMoIrKvA+l6lICEDI7p318UlY4mt2MQTgfVqKgziw/CwMNMrfR3VFnrrBB++HDRIZhv4ZHlGaERGvaTgxq0YaZnUXWuk+ZyxOfrrXYONxiw0I2mDXQyF37Q5kyrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3Wwl-0004yi-1m; Fri, 20 Mar 2026 11:19:15 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3Wwk-001E1T-0G;
	Fri, 20 Mar 2026 11:19:14 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w3Wwj-000000005GL-4BpI;
	Fri, 20 Mar 2026 11:19:14 +0100
Message-ID: <2e8b25b6563a6584d77fefef28cebf88b115b93e.camel@pengutronix.de>
Subject: Re: [PATCH] reset: rzg2l-usbphy-ctrl: Fix malformed MODULE_AUTHOR
 string
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org
Date: Fri, 20 Mar 2026 11:19:13 +0100
In-Reply-To: <20260318120854.226783-1-biju.das.jz@bp.renesas.com>
References: <20260318120854.226783-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

On Mi, 2026-03-18 at 12:08 +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Fix a malformed MODULE_AUTHOR macro in the RZ/G2L USBPHY control driver
> where the author's name and opening angle bracket were missing, leaving
> only the email address with a stray closing >. Correct it to the standard
> Name <email> format.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Applied to reset/fixes, thanks!

[1/1] reset: rzg2l-usbphy-ctrl: Fix malformed MODULE_AUTHOR string
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Dc961cc86af01

regards
Philipp
