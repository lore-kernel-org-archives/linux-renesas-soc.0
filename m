Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422907;
	b=GgJSArSnpEoTBlO654c+TbqJ8bqb5zrdG7aYA8JGCCirsvcPf7b0GTwLNNpJjPRzduvZ
	 +zhS448eG6VQq5XZZBm2sRiMmsmTb0hddsrWpczFNHr3KCt4u+0LLBxWLUD0W2CjvevSX
	 mqDXupU9ho5Bvv+svwr1vqovR3T5di1XQORa+owGhwFgam+X92UWX/ObWwz8zuj8ADGTH
	 aKs9gND8tPV2T6RF5tP6/eihYe5T/1s1ZUlYikOZP5aoZ17aspIZVyVlyOVCB2p6WNzTG
	 qRLqO+k4pelInx8zTXfWVldQC3GX1R3n+G4UghJ0znwMl+xTQLuJtprwcW0rgZVLG9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422907;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=E0l3VMRYYn3rbrO7VzhT1ZTPg2MqAf5ob25RkTAMM1I=;
	b=aPlmAgo9ilqqoEzkF+9Qi7UqJ/RqeUaYWCqWLfO8xqE6dfNYOJbVyxR24s7Nl3dl0pmx
	 Q9k1Ig5KD6Up0mTKZ9YLqw6vu8AoJL+qj7pPPnzTxj9pVfBKEUB50eFQ6X1jtJZGYLeEh
	 6yjRYkxxUQmSU+Y2xMKUeJghfKTEDWaq0yWHksgz86p2axw2/8zUSzcD2QigRYAPXVM1N
	 uj7MK9C6aanyUSBepbDS6ywy8uOl2oykUnRjssP0IWfy0v0Xkd4YbsixFE52gYrr5ufSY
	 Z6+CVDqNRdrjkTg+qAWBEUUOyVcdV59j9YnrgF8uFQlIWcs9zW+5BndcUNQAxuacX2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=NbzC0OJj;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAD5606A321
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2026 18:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DAD5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=NbzC0OJj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=E0l3
	VMRYYn3rbrO7VzhT1ZTPg2MqAf5ob25RkTAMM1I=; b=NbzC0OJjhh7BC9oQaZaa
	oSeKULF5Iazos6hGHGYSi6bHvMIVX1DYTmrQSTKHc+wrf7e4VRJi8YOMJ9KOd18g
	3seXy37CblwW0Hsp4tbk28221q/Nyz04Sb755H5Hjsa7ja3p7/OHlUGeRtPSxav1
	QhxRdANT7W4zLKZUEExDVXHNYnOxX7os6d3tGljwDs2NTKb+lAJyycmApy8wa043
	jwfar5HUM0qwZyyg8AfffWJBd1FrZq3RNDgjQmLnE7gKoYSxtGH0DqfD4fCIU38d
	nAawnfkH9HWmEriRzLvmjNIkn0seHC+kH3IrGT+jLZFa1V/kJZyTboPY1xH8wu4b
	sQ==
Received: (qmail 717094 invoked from network); 11 Nov 2026 19:48:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Nov 2026 19:48:21 +0100
X-UD-Smtp-Session: l3s3148p1@xxedowRgkqUujnun
Date: Wed, 11 Nov 2026 19:48:20 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, p.zabel@pengutronix.de,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	claudiu.beznea@tuxon.dev, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v7 00/14] PCI: rzg3s-host: Add PCIe hotplug support
Message-ID: <avS4cLVpkXI-Lf0A@ninjato>
References: <20261019065025.2146539-1-claudiu.beznea@kernel.org>
 <atphAmy8ZIjY_JNC@ninjato>
 <f1df2818-be5c-4019-a86f-4e782a70d3fb@kernel.org>
 <avOBDu8XaZ-kZIsF@ninjato>
 <85acc16c-01e7-46a4-af68-3d6f24fe90c1@kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i8DyTstGpuGYVzFX"
Content-Disposition: inline
In-Reply-To: <85acc16c-01e7-46a4-af68-3d6f24fe90c1@kernel.org>

--i8DyTstGpuGYVzFX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Claudiu,

thanks for the explanation!

> E.g.: if you keep the ASPM policy to default and generate a link up/down
> event that will not be seen by Linux. A subsequent lspci will trigger it.

Well, 'lspci' does not trigger it (at least the busybox version I am
using). But setting the policy to 'performance' does. Then, the 'link
down' event gets recognized late. I'd think this also proves your
theory?

Happy hacking,

   Wolfram


--i8DyTstGpuGYVzFX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr0uHAACgkQFA3kzBSg
Kbab4w/+NI9SywY67C+5DdfMPzk4r5al0ostESZnFHoJobC5GDubnx2/QKKL/Tju
KHvueIy6bJksk+ll0ypxtE3YhZ3GSoMJRhlA6REovCwGTuxfH86JqiZRp/66if6s
YrpfavhOvAZYLquOZufA3I29HnqUgGiztLCVRIx2wPRKpUTG2oAz0GipFqFuhq/P
0vtSuzRHmqk/BGmmteQdqLIdKuN7RYNHSzsHsoHVk/1EXfUBSZ/zHuzmTecn+PY/
DhSbw3yyte2bPrrzmiug5CXafDdgrZjj8d7cvbn9euvZ2oef/HRuMcSgQTRgzESd
fxEOCYRPpcuNAciBChTEakYq31ZtDjvsZmG7Y9YWtGBOsOTqMyxYd0pNM7r7L2+G
DKWElrkTaufbz2kG45J9i16tBtr/GowvCHYyqNUcoa9mDPncHjaGACFOR/c8z13e
8q2xWMyMCRRvfGh3Ytqaqku7noFHoTfi4UvBJWWu3eNHy0hXu5HygT0pJbrwFCaK
PEppoCqP2gR4VDMKdD7/7YRrpSK9YLiTuJTFetjIe0iWpZ6Mfw17EIe1zKPALlSP
woQDMeFQgdrbt8+FeVxMLEEBuY82HndbavhsMlcNzi0Usm8745ycK7BB2bwwACDQ
EzTzRgx54Jb7zaVdZHlXvPbdqsPJgcBxPDJKX0ctO4jsDO4IMoQ=
=MJBT
-----END PGP SIGNATURE-----

--i8DyTstGpuGYVzFX--
