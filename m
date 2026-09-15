Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5653347B43E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 09:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465992; cv=pass; b=KEodB6y9LRCYGokrSnRwF4Xq+00Q/UGxcMTVQIueS7WVAGil+scpUlCfuJxUW9qCwIwX/gN2R+H3RyYG+tV2pzZ0413b8gKUA7l26M1jcPM/w1vgl5smyhgmHvCB+SH5rbKrvb1deN3locdvpyrTIwYyez2Qqx9nZgC7hcFVZtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465992; c=relaxed/simple;
	bh=TpVMNylx/LfnqzH4fiOUwjVx51QOsqnFyGwrmo6p0gg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gV+4w2bsf5KkZy/wEYS+wgNI4C2WW+0UDHBxcR5M8HjlKth5POflTSpCQ8Z8fITfr1jrgMELXyKdI0VLV9/4USj6txOHqxfd2VutRt8qzN1nWPhvhmE1PQ1rTw5iUxeIfwLblp1kpz6rIe4c8kCTxH7zFdMUtXW4Q8qSYZutVII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzSAh5z4; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzSAh5z4"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso19207885e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Sep 2026 02:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789465986; cv=none;
        d=google.com; s=arc-20260327;
        b=Tpde+iNRItAXNTn0svqK7ibKidNL6WXM1AU8aVVjLIOXrqMlGncmoCOYdZcJMHxXYJ
         A0+3M42PQ8s2dqVB11BzVLvOD2r2cAAo/vOrqFhB2AZogvEoxvCeWbkZeuiqYenRAZVX
         H9KO/eAXmueUy4btmTiwKJZlXzDn+V0KfUdTWuyjTmsrtW8NoveVer1krPZRqkpiWeo0
         8CjZ/9L+7LMFE1axEvjjQgzOjG2H5iSfuFNrJtTZJ4wBz8SrhYOfth3ahpyslegzZMRi
         I0Vl0UVb77El8tx9i9b6f8Jt+hl5g3dI3Bu/tOVZfc65L6DJni3x4uUoZ1xTBNsWgTlH
         2btA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VRIRT8lVdgTRcvAyHF4oWWO/J36h42SC/PtuITyg0U8=;
        fh=5NhBa0771Ik7rI8ySERx/7S8siOGvPpLYfMkuayorw4=;
        b=o/GPMP0G/g3OyKczeZti8VEbONxMhTiS2vJJyHDjqQtm+1TaI/6eciFeYSn0y22Bd7
         aFekUEUWAedsVb2p0o8iEocn6UZ0L6+8+C/FtAG36KtoCFmCmacA47eiL1ES8SR812XX
         5a2ZQG4Y9gt2i5kldLRNrlGZS03HuRSiigHf62rBhytzLw1cghZQsKWIuxWv2XO1A9BR
         WWDyPt5JkhLLl2M5znCdOLieDGCeYj42ttp6NcUEmaKJXOTf3unilyKuTmesTmUGv3cn
         nxH8RjnRQAIrRcyktOAoFjHbWVleEU+P4eWZBdNYnnPeTMjJMaZOSI3zh6OVYYUMRoXf
         6GNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789465986; x=1790070786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VRIRT8lVdgTRcvAyHF4oWWO/J36h42SC/PtuITyg0U8=;
        b=FzSAh5z4Por1PRchL88s4zfB59l7JqqjNyY9lKi2FQmSUIkn3wTdZQhx1RN38gfqhf
         PTc+hcts0izlxHDMsF40O0z9+XoI6ur2ISGtCsC24FfpIqm+Ps2MTCTqadxX5fNWQM3l
         iq2L9oI4ljCOolrewfhUMhlbnn1DAD5ZsYvnahJrA6Taa2vOv1xiNWKUi3KhIAweF1gg
         Du2NxVZXDiM32MvU1ps7uAt6BVAORUE5JfH+65fpL315bxbmTWdhE5oIPe1wYSy0esMM
         Cy98sWMXxPILdXY1t3HTGohI2Gv0lsjsjSkCVcjcr4y0dJ9DdzxlP/2ljdtWp2DnpmIM
         x56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465986; x=1790070786;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VRIRT8lVdgTRcvAyHF4oWWO/J36h42SC/PtuITyg0U8=;
        b=xefYqfusTvwDqc4Dg/U7kNqASXYWR6QbanjQsxiY/Xjb/BVZg5V/Z2rxbptJIvsDcu
         GkBXTfayMflZTfhgUarxJX4dp7i3vtfD+/KSM0cL9uDAYjudV9CrwBmAybfGtcRl2Trf
         gjkLIoBN2t9quIqJDPQSn+obuvIWkfeH1MIWXnIaz19KPjOQ8cdNGBzK1PHW4hejrW8Z
         VrHZRhKc6GI0hng2tK0C2xckCl5mwgPFc1BJS5FJA8k7cIrcC6HHwsYTGIsUL0UuS4LI
         J+d4gYDpj93IvH7f1Ju33O9oxEPYFtVfQfKmtWa/JTfAam0Qb8kZH4DR6yK9G2DYXkWZ
         yk4w==
X-Gm-Message-State: AFuF++klxuFQd3oB/KQZl5PccsMws/byfE0m9OMVSWkJJhxbYlaO0FN3
	RtuVFwZRKiArqpDNX+LBzpUBMvLKRXs557n8i+sduTz22iAd30iapV0ZQJR4BjRh0TEISnNVC09
	CJaYiDr2uoRLI7GpNH/868jo4iu6f+Xg=
X-Gm-Gg: AYBFou13MVDCi6ASCt1qJ3Xf0sfhk5g/KpnXbtj+dGjFySmDcXJ9lw2mgHsZg+JQvYo
	9RaMa0IMkAZyeMp2TJkirjOUBClpOlAKAYzVuzxIOayCa5Vm2o1mz8bhYHzYhIVtDz1lCtJX3P6
	v99raVqyPhSj0gmrh8O9iedviXcnoNTFqk2sjbrKOks6twUoxXUiJmeVT9xaspMS9Bai2kb9Rmm
	MnCfHzYgZXpupvP3aYwvju4jK33mjG93PMxZ6LKBztDYHKAWbtZA3CsZPlFmd+RY8Hfg+P3umcX
	M7hrCZUnEZ2h2f69v2LLneXi6UOlGGO8Kb5Vg29wUSGGUcNzwiK9DTsjTJ45Vl3tpo+8rry6CSd
	xRWPACwy1e9zHdyGfYYUfbyj5wqFyybvi3WZ0cM/6
X-Received: by 2002:a05:600c:3d92:b0:49e:6777:da79 with SMTP id
 5b1f17b1804b1-49e7a678649mr84046735e9.26.1789465985857; Tue, 15 Sep 2026
 02:53:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914211826.73727-8-wsa+renesas@sang-engineering.com> <20260914211826.73727-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260914211826.73727-10-wsa+renesas@sang-engineering.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Sep 2026 10:52:40 +0100
X-Gm-Features: AcwNN1Udue3OHWdECCoWcwp7qk6bAA1DwRbc1YPBqEjPdz7MomEMSfQm-K8-eUQ
Message-ID: <CA+V-a8sq0s8x+Wrk71ncNER_MS=FtLTsxf3AK2UxrTDRqB+msA@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: rtc: rzn1: add SoC names next to their IDs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 10:19=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> This helps maintaining because the numbers are easy to confuse.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../devicetree/bindings/rtc/renesas,rzn1-rtc.yaml      | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml =
b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> index e96007981c34..7ea77cd0bee1 100644
> --- a/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
> @@ -14,14 +14,14 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> -              - renesas,r9a06g032-rtc
> -          - const: renesas,rzn1-rtc
> +              - renesas,r9a06g032-rtc # RZ/N1D
> +          - const: renesas,rzn1-rtc   # RZ/N1
>
> -      - const: renesas,r9a09g077-rtc
> +      - const: renesas,r9a09g077-rtc  # RZ/T2H
>
>        - items:
> -          - const: renesas,r9a09g087-rtc
> -          - const: renesas,r9a09g077-rtc
> +          - const: renesas,r9a09g087-rtc  # RZ/N2H
> +          - const: renesas,r9a09g077-rtc  # RZ/T2H
>
>    reg:
>      maxItems: 1
> --
> 2.53.0
>
>
