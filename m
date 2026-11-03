Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793702196;
	b=nl5TVVhklqUfEKSLFTf8xOwbK7KxiUdi8f4fq0K+tSmSA8N2RQ61Ow4L6TZ6hyHPaxEI
	 pOMWeFW58E+lFRTDDywIsd+bn8/fTaE0QQGFIb5H0cWE9+/kZ/2kq7l1NmXQ404PHyDKm
	 Uc3PWLQXRy6jCb5TuOcbCFH+/oGxjhDggMkrJ1RmuN1KSCXTRyD4GbJ8tibG3M2H51Ge2
	 DwlzBRjqmhpYdLVZ3+3ep5oPWU/yQZPi/JLdskqvxoCAvLXAsafBMj58f93F1eje0zEIw
	 Q8MBArqHq0IMlqaDmtFHIx+R61OBnBB5yuQJ/hyLD3d11422KR7UUkL5NsEkiVyC9lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702196;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=lh7gDQeHK1z/rQFertzDH/idTE2HJauycPAco2arkX0=;
	b=rCvpxUZErZKH1p1IooFIG7ECM4BagNJ0Onq1kGRNmFn+BtMtutBhiKdh8jQTmBLaV21B
	 ZxT70y/xl8Hwn3rAHEzQ4itpJ021+/NtBRIiI+j7XkaDOkpPvuHe2Fy+wT4Mz+Iwdpjqu
	 IcJpKfZ6IBQgb/Fc3B0vaKLni2LvhWxt9LAF/Fb3RAZXZfy6PUz0HJaZuuxMcfJfO4rdD
	 qsGDRLionMhDUoI+4YEEQ9bzJ+0Zf7wWxcqWQ/WmYQe6/Q/mOmsViqGdkHyQt5UEGm75n
	 Iztxf6i4a1wYzT5FGK9/aRuB6JAEF/IA/PcKl9ujk6xJ2vQ3sHgOvnF5doqPueeaLGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=IAhVlgV1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94436071538
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Nov 2026 10:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C94436071538
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=IAhVlgV1
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 16AA8202299;
	Tue, 03 Nov 2026 11:36:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793702193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lh7gDQeHK1z/rQFertzDH/idTE2HJauycPAco2arkX0=;
	b=IAhVlgV1Mu8CaebuxxAEyQWs0hDX1P0RFYBbNvxL8LC7WQ0NVyf4uAhxGsn/HtnnJpieg3
	eO5lnVpYKlkvMFCCZOLJWdstheE6Ih7qpvOvXehQibqwnjz/EldGcSqG4xMcMnJRNJENj8
	uwN11hXJXAiBXmwFmC8jwERRvkdAa5/GjdG9z5vp9qWDfrGsGiA+08OEh3TPQTmajmuFar
	wsadd1a503Jx+C+9ykWfvOCkacPUrLTKK8AJqkdflauKzufzf7AQjLg+keuRPn9+dwEkCt
	mK9+GAI63JlnHdl9T4XTbht2gN5ISjVn+I49akDbxXIq0kWL+/sN8uDU1ygAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793702193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lh7gDQeHK1z/rQFertzDH/idTE2HJauycPAco2arkX0=;
	b=Pl5Np5ArroNBT+LP5CCK6PV4aDZfaFa1x4FNWZHgLF2jApjR6JF1CGRYaCULcrq29wC+xJ
	A+EtEPyQqZLTHjOc7oUfYqawzyernNhy4K3aniq15dQbRB31DcgQdFeEmsVfyR8IjxwwpB
	cGxkHjiRNJp6fDZyR88o3mrX9b0y4ixYG3bnINpp75tjKhcSVgcnBetHo9qBwq/tep0ost
	vtF0y/kdM52HAkzqZncww3lFHUjW7P8HteE41bil8o1KFr6r7+k9wKbW+onM9QtqU+/fO3
	C9ux1Uy3y3M6a4/rGxAkAB9UU57cEz0u2sitc/DKgM7c5zPKj5MhBTMF3nK4Kg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793702193; a=rsa-sha256;
	cv=none;
	b=LQjSOxq/f+et4yHoJmHeH3O+cFnH3qwed88dnb5VeEhVg5Nh2iqJeEsTqTETqQGR2VbU+b
	z31YHSZx+sFMShwj8vU1o2GTrWt/ypge8KisLbeGu7H3ME4yhLO8MBf62mP5so5tEYGHIZ
	7+qQU3mO7uE/YvRl/D8m2kgAASqUxLFZTihqIlu66d1TVs3N7ZaDdDvhzCQz1a2TDRdXn3
	/7gmMMd4Xi2VpWz6PRKTx+y4PMqsrBp6U3jIVJ6w+Rf9eXJ6YDbQhguGACyb6qx0LLLdjY
	0zYDkUmaT4IK/TI5qC6NXlyVrQlVgvN6XLrMlgpspPqKhNqQRxlPoetQw1/ekw==
Message-ID: <1375d72d158cca4c7f890c53c306261444b3ccd3.camel@pengutronix.de>
Subject: Re: [PATCH v11 4/5] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju <biju.das.au@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>,  Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,  Chris Paterson
 <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>,
 Prabhakar Mahadev Lad	 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Tue, 03 Nov 2026 11:36:32 +0100
In-Reply-To: <20261005111854.275120-5-biju.das.jz@bp.renesas.com>
References: <20261005111854.275120-1-biju.das.jz@bp.renesas.com>
	 <20261005111854.275120-5-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mo, 2026-10-05 at 12:18 +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The RZ/G3L SoC has two OTG controllers, compared to one on RZ/G3S, so
> it needs a separate rzg3l-vbus-regulator driver to handle the
> additional VBUSEN control for port 2. It also differs in how USB
> PWRRDY is controlled: instead of the "renesas,sysc-pwrrdy" syscon
> register, PWRRDY is handled by a power sequencer provider.
>=20
> Add a regulator_name field to struct rzg2l_usbphy_ctrl_info and pass
> it to platform_device_alloc(), so each SoC can select its VBUS
> regulator driver. The name must exactly match the one registered in
> the regulator driver's id_table for platform bus matching to succeed.
> RZ/G2L and RZ/G3S keep "rzg2l-vbus-regulator", and RZ/G3L uses
> "rzg3l-vbus-regulator".
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
