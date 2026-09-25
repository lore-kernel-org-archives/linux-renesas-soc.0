Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA744199947
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Sep 2026 20:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790368720; cv=none; b=lszCBlJ4CVKShz7ZxrAyShVBgPXEQvMHBPTFOKCTWtS/RaMCVsJAoAuwpKr7RWlM1uoithyI3uy2NB/MnR89p3XRd72MzgLsBgFT0eUkpaXCndSY+R5r0fcu/UIHfyU9uOumxwZwkni/vxHxUGb6cWL6IujWErkHv5T7Yl3aSQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790368720; c=relaxed/simple;
	bh=0CnRwp2jLeR1GGpodqbEn2/AM7tthevy40R6nD1aG7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=livQy5I/Vgb/5nw870Z23AgQebtlm0IYe9XNozCmS58VNmy76jSqUcKy6M5PR2Ej9cx/vRRwljsNo/5bxx2sMyzQoDSLkdMw/F+3fM50W281RuHAx68qUGKFNmHQvoNxLIukinnaVcGzK3c3p4xpmrfIUp0EMsL7q1NDUI9h/GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Pplx8y7f; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Pplx8y7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:mime-version:content-type; s=k1; bh=wI/diHdVykyLnuWpHqLKfwXAPRG
	K18g9SqSvaB2Az94=; b=Pplx8y7f+t+/H46KKVtrygSn0D6qLhgF7G2fq67pn/b
	eklurYqnNhohct3Xd0QBa6pNOx3UOqDyU5HrPLLhjmDnns3HlnGyjakonnT1gK01
	SSZHHpsBfFYIaCp+afDVvkxiasdzQH6C4En2wfdmMYGvgMbD+pp4WlvBXqpX71FB
	9x9BCa8Er2Zpp4NiZpFbQg45yMVfSgzGDyb15uIvv8V7Jm2ZbNgdi+wi0W4UmY9p
	yaDkZK3m9b/d/wyygL0Ex2NlvH9C0eeAgTTOUOdmYulURcn5Ix5vdLa4ieuonX7y
	JUXn2VjhuoCml90nkqR1krDwbKQPh1XQXGeILb3mxHw==
Received: (qmail 1688359 invoked from network); 25 Sep 2026 22:38:32 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2026 22:38:32 +0200
X-UD-Smtp-Session: l3s3148p1@q2Mds1RcfOcujnvn
Date: Fri, 25 Sep 2026 22:38:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: False positive warnings regarding phandle-arrays?
Message-ID: <arbbwj5z-YIVkfWL@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aT4d0yohW29k93wy"
Content-Disposition: inline

--aT4d0yohW29k93wy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

running dtb_checks with current Linux git and dt-schema git, I get this
warning:

  DTC [C] arch/arm/boot/dts/renesas/r8a7790-lager.dtb
arch/arm/boot/dts/renesas/r8a7790-lager.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent:0: [99, 100] is too long
	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml
arch/arm/boot/dts/renesas/r8a7790-lager.dtb: i2c-mux1 (i2c-demux-pinctrl): i2c-parent: [[99, 100]] is too short
	from schema $id: http://devicetree.org/schemas/i2c/i2c-demux-pinctrl.yaml

(and a couple of more like this in i2c-demux nodes)

This is how "i2c-parent" is described in the YAML file:

  i2c-parent:
    $ref: /schemas/types.yaml#/definitions/phandle-array
    minItems: 2
    items:
      maxItems: 1
    description:
      List of phandles of I2C masters available for selection.  The first one
      will be used as default.

where Rob added the constraints for the phandle-array with:

37534121c4e4 ("dt-bindings: Fix phandle-array constraints, again")
91f9a47ddb9d ("dt-bindings: i2c: mux: i2c-demux-pinctrl: Define "i2c-parent" constraints")

I think the DT describes it correctly:

        i2cexio0: i2c-mux1 {
                compatible = "i2c-demux-pinctrl";
                i2c-parent = <&iic0>, <&i2c0>;
                i2c-bus-name = "i2c-exio0";
                #address-cells = <1>;
                #size-cells = <0>;
        };

Is this a false positive because the checker cannot distinguish between
two values with one cell and one value with two cells? I think a
potential fix belongs to the checker ideally, but maybe I am wrong and
need to annotate the DT?

Thank you for your help,

   Wolfram


--aT4d0yohW29k93wy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmq228IACgkQFA3kzBSg
KbbQzQ//UwhcRK1eYcrst3Lc/UIXNiKP2xCyQfKMmdlLUAiYGn28MedOvPK3GN1a
BmmFNQBFlz8U5VxeWmvbYwPNhQ8p7Fin/wwLC0TO1TlxZlOUrvd34UkKynKqHnaS
uKlBjPhXAUDHxsX53NJKrnwlSZW0YprebYSRDik7GLzT4vrbVb4/V6KLUMjTQPGg
6b2B0iPB7ovU0s7XmKaa3odjQ9sfVm+7YzYog/Y5gu8VlZmMWKfVJipFdX0zivJG
skd4dVCL+fXX2oP7HRLjh4X7eQ3/bRyswlU8IOYPLwtTj2LXmWKyxrC9UUaiZERW
VcUpCHzjhtfSEDQzP9/KvdQdyivYMbd+TICR7mVWkZeXeh00w+J2MgTgVlhSmjgz
39SNI42X7oC73rSgAMg+T6rKgg6IRSTnWiavBT3w8GuzNexSrhcAMbFY1YjuCtNe
uM79ya78xZxJsq+bcoiy4N2tQrQeeDaDTy67KfjfEWLubuHxMUBxqxNW60frYht1
AQuJtzqzjFs7K1HCd9P7NNCXQMIrTrqTMNDNNvu3FH8Tg2rfGoNYESWyp+3x6Hvs
6B3fZryMZROfMNKx2nzHne/Ns4SUcq/S7vLlnNoCnvOQdeLhu/Ljzc1rLD8dObpq
f0VoCK3IPNLbM5fBb/HhXkp8a+EH6wvqLjwk2oXkie2nDXWwV0U=
=04MK
-----END PGP SIGNATURE-----

--aT4d0yohW29k93wy--
