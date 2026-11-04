Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819721;
	b=4w4jDByp2/caqVvRa20uwkOcZdSZNwBG+4458codil+5HdpVIa3jmQkx6f3tauPAooc6
	 zarQ+uW3niWTUzgR7wB5ZUGPyOpnwvJi1YI2iFFqe3lC0MLxCeFQGD/mtIN/kc8eHIZMG
	 mwVBrdn9osLIYl4yrbhVA1RvMOHRM5irFNva4qPkNZtvhkcN8CjLTdnANhW8TO3hT8aQk
	 ouFtmkj9lTxeWzaE4q00fKrsXgaMusf6vFRrHF+H2jryjTqLejDcjJRvgyDPRrnYOhh2M
	 bpQGVl9NWXUiyUmmVFOsb4oeZf3HNReE2WGXXsn8RDZlnKcnFvSd4L7iKMTnQxJ0j5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819721;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=n7BS530HV1lVozfJXYDPjT1FuSJaYmtiEdjDoPBh4cQ=;
	b=vLr973SaqXXGFwVV7kSRG6d4I91VVKXqeWOIFusYzsvcnJdly0XkkGCtby8W4aMyo2o4
	 Jty7OCkPcredmqIByDKzNhSsHnxdS6/+o4EZ5HDa40sSZC/pz3FSG572+m95Q9NwwAdJY
	 b9r577TeCTbo/PM4y5yqCsNHPWsnprC2cSOOoZD+9/gqOINy5Cf1EtTzzQaWV0ipPH6ke
	 lyq+Iwn85FlaQKaiTVb9NZdoSdqqgfYX/WJ8md0ssYOTxKSOmFLrQv4ZQ+qGwcSf6jNTi
	 REx+BqzDtziiucFXXy+fC1cqLevi7tTeFsEttVdKm1AiLaB2nW3wBEx//oV9WJrlMDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3088606D806
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 19:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3088606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=n7BS
	530HV1lVozfJXYDPjT1FuSJaYmtiEdjDoPBh4cQ=; b=UgiGrhuQy/mGgu5Jhrxw
	U4iW26+36DDe3grM+u14/NvLDCpHeZ0xiuEvuDfDUqellkU1LwhONVcAqHtWqrir
	+SR14FFVUQSG5N8j9hT4Cqak0uszM2oARxHzVMCg+ItnXftQckX/LD8VCM+MbgJc
	OtVMgXRPjBzQAIuW9E6952rvSrTqZbNRihe/dNbxKmeIUosago8yE7dRio1e5h1I
	7r89PejZOdMx37FuhZ3BUIHM1jqAtG2m+yjmE90HpRiC97xM4UAvVvWl+2AQIqkd
	Vyu6ZJYFPFaN7JKPddkG2Jo+0Hsgr4JxwNT/o2TWXoegl8VH2SscRRg4OhSg9R/h
	jw==
Received: (qmail 833035 invoked from network); 4 Nov 2026 20:15:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Nov 2026 20:15:09 +0100
X-UD-Smtp-Session: l3s3148p1@LaeQMnhfGLvAwtcC
Date: Wed, 4 Nov 2026 21:15:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: i2c: renesas,riic: Drop clock-frequency
 from required
Message-ID: <auuEOFZ8Vo1OUTw6@shikoro>
References: <20260806111018.782380-1-tommaso.merciai.xr@bp.renesas.com>
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
	protocol="application/pgp-signature"; boundary="glWaHYKG2SMFiRw0"
Content-Disposition: inline
In-Reply-To: <20260806111018.782380-1-tommaso.merciai.xr@bp.renesas.com>

--glWaHYKG2SMFiRw0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2026 at 01:10:13PM +0200, Tommaso Merciai wrote:
> clock-frequency is described as optional, with 100 kHz assumed when
> absent, yet it is also listed as required.
>=20
> The description is correct: i2c-riic calls i2c_parse_fw_timings() with
> use_defaults set, so the core falls back to I2C_MAX_STANDARD_MODE_FREQ
> when the property is absent.
>=20
> The stale requirement only produces dtbs_check noise on boards relying
> on the default:
>=20
>   i2c@14400800 (renesas,riic-r9a09g047): 'clock-frequency' is a
>   required property
>=20
> Drop it.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Putting it into my for-andi branch.


--glWaHYKG2SMFiRw0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmrrhDgACgkQFA3kzBSg
Kbag2w/+Ppbl0Sufx7faX4uyhGSaA898V2UbRRgfxY7pqzPN4eaighcl3Y4DMLH9
KQauzZK95aseWVDMJn2Q6OhVSxSV+aPLMnGKICp9LORM2rrfO8j7TbV0SrTUrl4R
0YUEJ1tB0wlBZqOjx5PQkbfAhZTSQLzjtwX+m0pZ4vf00O2q1q60dxJGCay3tmbJ
F6DqENIdCVXeZBNTy3g2+ZWtZvZWoPM3Sq5HBboMogQAYlfmSjinIlwgxxtNAbXj
1nwZyrmBtMZmdb6TUeEGB1wRxUaFhUrxx5KOqEox3Zvrvt7bzK6X5dAik8y+EzX3
Q34yblqCZ6g9+h1Em98vgc2i4M2NgEQKKhCCqCuKBkFGvR3C+TG8GXMsLtuYT/4g
MTGPvQaX+N/uMGCw+fF2BQY20DXsYj7Cc6vDeAycAxM3pnH4CeUAhc6OmImM1clc
rTPueTxD7uWJ6brrziz4wXHQEX7pYcGoDTbqtr4ORbJW8PNeroznAGtYVv+swR0b
Ki7W+6l5+oyaoBHkAWDWctyilzhlo5kC9tayAFkjiZR9tBG3R21gBRnbvWVhl8Fg
q1PHlIRIiqCeSyK3+iRAxrKizOz8hjafmf/nnI5oyvom6omsrFSm87q8s3trDi6J
9F0+uO9FXfemivdmB1gu4yPfrzw1WK31Wdm4l+0SfMwtY+p2uC0=
=UmDj
-----END PGP SIGNATURE-----

--glWaHYKG2SMFiRw0--
