Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B65943F8B8;
	Fri, 10 Jul 2026 16:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702523; cv=none; b=Prl7hlqt/1H8/R6Dh5chah9XiDrfdOHPiKgoG011V1xi4qa2Iq4SvctU8J6vp2THvrZnrfQlv1iCvtGOGgD3UbIukHA5GuXE/VcS7c3TlELiT5HQp54rYI5S9LZCPFw+MSmDEg1Qj7aXMeTui5dH5sCjFbnT20jrTMGmCQr/wLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702523; c=relaxed/simple;
	bh=UjxSN9svmwXOeyJ1UPe3NeYnyfx/h6gTHTP9Tc+U/5g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gzbm5vSaXEJDOS2DuowdbGVDkqDbl+IkhJsrvKnRzwu/nItg13HTR0ScfsA1WZb8ZKYwKnLatwsf6VmTaBfgonCk0lz1aNkfapo2lcpO5X5tbcDoyx5MWDwJtoFsv2iTzMfFXvd4elsxErKDl7s1UO5tiH5FtrQCwux0QZZ0X/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sLmfLuOd; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sLmfLuOd"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gxdHW4C0RzMlBX;
	Fri, 10 Jul 2026 18:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783702519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UjxSN9svmwXOeyJ1UPe3NeYnyfx/h6gTHTP9Tc+U/5g=;
	b=sLmfLuOd1o2QsOdRII9dnXDrfO3VvwfIMWZWI2Zm6jCEPgsKW2l7shxw3WHlXBDMxp4SCt
	bJVvLPVrb4hpNTyr5hF8dNaGLBLc9cso2lJDYkivgAQI6+r8+zeMMegtB3afQRN+0owCGO
	tG+iclJz436BI4rlSd48gcMCWSmMIvzmEyVQFgNm3352b1dsv4Odb401lCHRBDo3VDyKQd
	oUALxiEpgIyepfz2ZeCbprhsLb5yTyHvSh01B0Zp0KQQsciC2ly4SjSLHxeEe+SRY8otVY
	tX9e99kWDWMj3rcf8Tsy/mj+WHt6ROm/MhrKVw6c8XiMMeig9ypFV8E83SxQ8Q==
Message-ID: <a3723ad0ac56ca5d6986d2fec5a02386b423e207.camel@mailbox.org>
Subject: Re: [PATCH] dt-bindings: memory-controllers: renesas,dbsc: fix
 bracket
From: Manuel Ebner <manuelebner@mailbox.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm	 <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Date: Fri, 10 Jul 2026 18:55:14 +0200
In-Reply-To: <8ad5043e-0d5e-486d-80eb-87168d9ede87@kernel.org>
References: <20260710113029.436415-2-manuelebner@mailbox.org>
	 <8ad5043e-0d5e-486d-80eb-87168d9ede87@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: fcxmjbho7dypwzhr85t63i6cb7qj5m96
X-MBO-RS-ID: 5d12656b401615a3090

On Fri, 2026-07-10 at 13:37 +0200, Krzysztof Kozlowski wrote:
> On 10/07/2026 13:30, Manuel Ebner wrote:
> > Remove needless ')'.
> >=20
>=20
> You sent multiple patches like that and that's unnecessary effort to
> handle.

I'm sorry for that. I got the suggestion to send a patch per file when
sending patches with Documentation/ABI/.

> These are trivial - one patch for all bindings should be enough.

I made a unified patch for Documentation/devicetree/bindings/. It's
18 files. get_maintainer returns 44 addresses for To=3D and 18 addresses
for Cc=3D. Should I just send it with all addresses?

Thanks
 Manuel Ebner

>=20
> Best regards,
> Krzysztof
