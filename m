Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B44547DD4B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466153; cv=pass; b=RKxOziW75pcWycucx9Zo5g+mXP5AhAeOgoPKHCcFnq/9CDrmhSqNmfZvM3p2wFZTNl43/41PjdIxrr2AQXwOxBen4XnpBNW46jlGua84uX4uOw6WeFCf0t5M1lGC9N3Wqs7mMbzdTYIwBAVHE+5UKhuodt6sWQpWa0BP8bTuNVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466153; c=relaxed/simple;
	bh=HeKvvz7zvJFqfPpm00Pp1LjX9n3idorFhTOrtCSCiy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGutm2DPHBNttlqmMzkHZ1YhH+LFBA0iJ1p7TF/eMYCg8gcI1MxvcV/afxWcSCE5FYtya5Atv5mojKFh9ZCxZjzgKiec5u/KA59FVcKnEvIkIMxRCWzFYhFej87lEHW2a/18rg+/QBzKcAeAFAEXOzu9DuVB1HJ7Kq5necVYJSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1tBxgO/; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1tBxgO/"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso34913f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 02:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789466147; cv=none;
        d=google.com; s=arc-20260327;
        b=EPZpjZRPi47SjuDlW1Oi9KMvp18hM7KXQVYMh8tkHq7uoIvO5TsyV1AVyHSfc2NrvS
         fFjKzzqQhOZaJVjxw1jmyKmjXFb+LxsWQkmsghCsOb13BEPgwEWstYFeUQCTcmAYpCas
         mz1Om4N7HbqZVzabj1B8XQ14nK/qvqhk38LRPz+F+CL0Fm1kR27+aDl5HW2bVUnoQS44
         etqiMTjwFPpuY0pZmEtFaE45KxBZOMfzfbkRso8isJlrYngT6IE5WyDi2Rf/etl8eg9L
         87scQEdCAMg971Qj+f+46ny9/myVJd4QFP1rfQQ4iO+x9QPsRxIs8+NBPYVPFnQQBfIz
         /UyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SEsT6FzXLVxpOxGT+T1rtf6sipgLJQJWYr3e70XVh3I=;
        fh=5NhBa0771Ik7rI8ySERx/7S8siOGvPpLYfMkuayorw4=;
        b=di6JPPFDBolmn+0FNM35Gt+TyA/UWW4Wc+1w46SfOXNHT9rI9yzmaRKX03AWTBzRay
         EDVgSz+iAsfZTNphZgI3N0nAwJK976Rt6uGl1i5tCL6HlhIRmYeORW9P6E8y93NbZVHL
         o2yMOMaCrJhy9hicgWLb1h1e7vPn1V2PXvEhSCvoSUFVk2jAso3yrjxEisoQXoB7MQFj
         mK3XUoUQ90yAM3G67tg9LM/sC+Wcqem/tgax7nd3wbFC/S6/ttqp9GVsb+aioiWqd1UJ
         6xIjBY3lTKudIhdd/VB3qOvKPQRBdkf0WZ0X4Y8RuAqVx4MVoTBVci9vBa6fZEiKRB+a
         3t7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789466147; x=1790070947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SEsT6FzXLVxpOxGT+T1rtf6sipgLJQJWYr3e70XVh3I=;
        b=A1tBxgO/a9ew1Z5XI4qBWUzgkmHIOgmnyx/fmxJSyV4ELaD3YXH2pJnG/fInjXgeeM
         AAauNGhpXX9tnzQ42evvtXpd+LjSDd5XTdG+FxHv8OEp/SEDvR45cPCsNfcLLi5qBDOs
         H5kR3g65mctsELME58MpZArA9KvR33ypt7/uhHLdXibbIRVICBJ7Igh/zQbRLGQLOr8A
         OWegkjajWUAE1xGSLve/vPOlzgPYVhtvOrAxGi2p3Qa4BEfGiRa629kEPTsscgz7NxsP
         4zwRwc99jvE9pFlr4X2pSbe8QreFRHSQ3gqq6og7QgYYGJLZnx760Y5QgjDNLpFfDPsi
         0+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466147; x=1790070947;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SEsT6FzXLVxpOxGT+T1rtf6sipgLJQJWYr3e70XVh3I=;
        b=TIFaoVL7xWfGglBXHvNqzgMpjObj4qxcSzJMURwLmMyj5QgyULpSYSvYFlQmjNL2gJ
         BG78sdp6MGhjEz12asrDIDujtYZJBPlC1/bSrNPcEAcMBpvO3ApbuIBAST8Tk7NAA4kk
         uH9FXNnQH5o45b2DS8Kcclrp/pX5vzmWQf9ixRsnmEk4nIs+R6pAbpAgjllPW9ej6F76
         THKXyRJN+mTR3JbJshn2Ah3HpwK9Hn5+Ji5mzp6zIn+8P3ndx5X67/ytOwmrzXCkDCFS
         FEQRmlR41F8l3Nrcf8n1Kd20MNtN+KqFY+Sv5Rp1DMBpw8IGADxc2YXGsqUvJ85amK1m
         UOpA==
X-Gm-Message-State: AFuF++mCIi0JS8N95arDCr1JFX8QxXRnSVa+JZXfmhs3YucoYelsTFg+
	v4QNFDa9UPTiWprFuCzf5Axo4DWZQKnRsKevXmKeWY1juROJlj5kpGvD4p7VvDzJ1R5HnCcPBLf
	9J0RZrAbUChA+RtTepALBNd/38P7jTzg=
X-Gm-Gg: AYBFou3ZfBVhw/lxaxhHw+GrvhTjcvf5dt2us3USbI2qKsGnI2//IqYrdfbcJGAD0MA
	tgVfHBew9SCx6TDm1z/ruVmoRZI344eB9I3KYg1cQZBCDgdxf2iM1s+1MYavlnq050KIsdIJYAI
	4Qux/4lBNivXOAx39uWjiACEjXKnRWuWEQne0pj3vnv2j0O5N0+TSyqdjNNq8cgSUYuD9f8Mdk/
	QtcazzYkWP3O7dpXrUm1OTK70IsCsMJSvFdz2PRWEATIDgkH5sRAf4xff3fu2b9wBHl3mGZrIn+
	kgjQABxjiTJ812jmguLA6vxkGC7DOFCPi5ZTn5Qa4B25/ODKxN+V4datviS/Gm+8dvuSRtuijiB
	jEPa3Q/w6hdu3WiP5HPoG8THqeO+UCBVD/YvhOCc7
X-Received: by 2002:a5d:5e93:0:b0:487:780:6a27 with SMTP id
 ffacd0b85a97d-4870a96e031mr15335f8f.19.1789466146523; Tue, 15 Sep 2026
 02:55:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914211826.73727-8-wsa+renesas@sang-engineering.com> <20260914211826.73727-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260914211826.73727-11-wsa+renesas@sang-engineering.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Sep 2026 10:55:20 +0100
X-Gm-Features: AcwNN1URPhirRROilRI3Axb3KZdRwJ_HGHfQgBDgapACZQF7IQIhq-6HjrMnUzQ
Message-ID: <CA+V-a8ssNZ4X+e31V59YdqYmoap-S1W3Vfois9oNisVT3izxag@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: rtc: rzn1: interrupts are not required
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the patch.

On Mon, Sep 14, 2026 at 10:24=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Interrupts are only needed for alarms to work. Reading/Setting the RTC
> works fine without interrupts. Drop the requirement for interrupts
> because an upcoming SoC does not have interrupts wired.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml =
b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> index 7ea77cd0bee1..b426a34958d6 100644
> --- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> @@ -52,8 +52,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts
> -  - interrupt-names
Maybe we can add a conditional schema check for SoCs where
interrupts{-names} are required.

Cheers,
Prabhakar

>    - clocks
>    - clock-names
>    - power-domains
> --
> 2.53.0
>
>
