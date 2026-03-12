Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46385386420
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 15:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773329044; cv=none; b=mWHBXYQQnVsnx+TT6h/1A7KlV9X242jmVeAghyWven6lm1DYjWDmaIutzug2WezL1945Jkko4WROojnsBIHUKOTMM3xXyjuFXtSfXfCLNthtmw1N8/+juU/MIubolIDzhw/yi9Dc17Df/zlDOh9tw+wP3hvBY0GV289CddZprh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773329044; c=relaxed/simple;
	bh=NYmyvxD/w7m4fnJBWlXf+kLgNsVJC1fqbTj1Yp+cFg8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qKJe12lRUc0EamfgqnDMYYtkAyFsTFvNRP/zpdKloIeo+Ue/dfES5w9NT3kMpqsQ+0jpMe8ryWhsuN/O2X3aqgtsQaSncUOeu23mLgvPzrihLPLadZXo8KVnd4K0hKFUDp6Zu+imsEVPbBlpfo+Elg4qwejoMn0IUy4TDGLoNKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0ht1-0004Sj-KM; Thu, 12 Mar 2026 16:23:43 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0hsz-0052iD-2R;
	Thu, 12 Mar 2026 16:23:43 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w0ht1-00000000CdS-00um;
	Thu, 12 Mar 2026 16:23:43 +0100
Message-ID: <3186c9c3434241473c05b0abb752b67875dfbe42.camel@pengutronix.de>
Subject: Re: [PATCH v8 5/5] reset: rzv2h-usb2phy: Add support for VBUS mux
 controller registration
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	tomm.merciai@gmail.com, peda@axentia.se
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,  Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Josua Mayer
 <josua@solid-run.com>, Arnd Bergmann <arnd@arndb.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 12 Mar 2026 16:23:42 +0100
In-Reply-To: <de4a569286a72a0319e4661643809cbed9172fe7.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
	 <de4a569286a72a0319e4661643809cbed9172fe7.1773319566.git.tommaso.merciai.xr@bp.renesas.com>
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

On Do, 2026-03-12 at 15:50 +0100, Tommaso Merciai wrote:
> The RZ/V2H USB2 PHY requires control of the VBUS selection line
> (VBENCTL) through a mux controller described in the device tree as
> "mux-controller". This change adds support for registering the
> rzv2h-usb-vbenctl auxiliary driver during probe.
>=20
> This enables proper management of USB2.0 VBUS source selection on
> platforms using the RZ/V2H SoC.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
