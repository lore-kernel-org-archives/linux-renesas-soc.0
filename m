Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B9135CB95
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Oct 2026 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791285228; cv=pass; b=sX2DQJLlZbMHYUi8sKuXDI3b5H6v9qZiEx0X7vc9/tsq7H7yeBAvv+D1smXETfWpov+1SraHyaDaDFoQ+PlrYFYzn2LjbUUTCoKwlCtLvqbokJ8SKReAC3bSbGdncvYQn2ezlRjr81f9hQpbW8X+jXu6UhqqSRI79I5cj8k67xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791285228; c=relaxed/simple;
	bh=xNyDpAmR5FGwhysiQJeqiOkY4NC2Si7kbY4uEVulYIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvkI5P8kUbH5zxEKiYfCLmL4d+DmTAFf7rgLkui0sX4xpgogfd2yt78B6oIxG6/P+v1B0VxeDddsEhg0NwS6p/hcUNeQGG5cneOiMR2cxNl7YTHEdUtn7Afo3CyoUzJ2mjEg4a/cjwOhEgGiL7Jwm62Moai8R9rCdO8ZW5kezUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7zt8yU/; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7zt8yU/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so5745015e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Oct 2026 04:13:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791285226; cv=none;
        d=google.com; s=arc-20260327;
        b=YpD70c5FWG/S9KtSZdVd7DxJ7lE7XnrTcXs1GbpjXkAfmGmcLo24guSfKiltqyGNqJ
         ZJbpUQxn8EoW4/SzDLn3ZBYFRs9VbTDilUaPmJsFbuSblX1aoWcxCc03ULsupzu0B3Zv
         nJxqKS5v4lUjKsHSn60G0fGJKyPXIHb6kIGqOggDg+3FhImFja5SFEE9xvNMULNXE2+b
         peHpKoypWSsKfiME4NIfHgbk79boLgHSl4AlftsCPAtleNO1W1f/IW2wAJcXFjo5AO7x
         1a8bClDFBxw/I1lXtqgYkZJ0jq0U15BQUa91MAidnZoSuPCvCk8Nks7Co2EcxIFz5ag6
         zR6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hj9KaKUC+O6S/8IjU9bhafDGIosRHpO/TG6hD/80Dks=;
        fh=dpkWsmBBUix6YUXYLcWR3Sl5lB3539laJ95AqOBd/zg=;
        b=iXrUytPiZ0DpoRITwzqda/bXfJqhdODLtwY8KIrDeQ0sLTjnlMBl8sRrRQyBPVcZ1O
         JYZM1AwEfM+Bc0YmCsGzc72y46qBwgEkzMWWLF2jETTmtOvebeQ0HdJnkm+kuoSxdUZ5
         XgYxgd6gEETd41OY+pQT+KL+5f3W7FTrAEYoXmKwAJNfBcFfHWJtIbJEWgN/iD2NcHbZ
         QZXjr2nS8sxskEXhXacQnjXb3Vv1YSaO2f5sz4TrfhqfrXwWsXSwBTYX05e4jejH/wUk
         A44QSB4FuLwOfKKI+rVSKaKNL2/SnVmmXKly6IzHuj/0/IBnBdTolidu8MswAmzgL6dl
         nSrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791285226; x=1791890026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hj9KaKUC+O6S/8IjU9bhafDGIosRHpO/TG6hD/80Dks=;
        b=C7zt8yU/Dr1uFq1oZpQuvKwQ9NBTNzA9jmFC9W5KhcHZjxApR03UeFJQDcJol09SB6
         i2K1HPpx8WiE3BQAFAGDjF2W0ufyBde+7+U3sSph68j9G5ij2rjdzoH7Vcmvqy0QvaZz
         ChlTJX7qEcBz2ZyDFALRphl3dyP1oO8vrmj0THdEf1najn/BWO/yuVxm8fC9Wxif1sLv
         Ki/7hqc7L3E6UgWFhExjz6p6vcyV7WpmmJtyDc8dINMwdjvgrvehodyAFeekWCVncNNI
         Uvrcq9UlCzb9toTkpTqoVs+picWgzybrR3/FektgdyFDuf44n7VAmRj4NXqzHip70qmr
         KzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791285226; x=1791890026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hj9KaKUC+O6S/8IjU9bhafDGIosRHpO/TG6hD/80Dks=;
        b=KudoqNVOCKJqP5epOpoSWN5ngNqFspQlfpGFCzuc/6hhAT3OGhy15RceN5+lBlvCIg
         KoaK8Nqgpu6gWTMUs00Ir6nn109s9E6xzp/IFNXzx+xVWwPRuoNtBCaa48oHzwj9pSFE
         FMLnxiIpEwYsRzVjO1shjqrmXR/4CuaWLgLSymEO231qMFnun83wHbHf5JFiyu7buXnQ
         6WsH1bhsN7aIpIBNDboyhAG8D7Vu2UpRG/52cHrnvStO5XSzqO7qNmbCvcVRKM7DcnpB
         IbFiv7RO05250hlkwGfDOU8h7EKLPmcGaFdO2tadvGCGo1aXioiBo+Rm8PxIoCUcFli5
         mrUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsotk2NkjviK6AwwRSldBngsar8UjCqZipmTi7OB1cMt/H2dOBZ7Xxr2Lx4caWfUXrfDYVecMfY1o38XolqONh9A==@vger.kernel.org
X-Gm-Message-State: AFuF++mlJf0mMQ1gEmPkWBA924VFZSxt1I2KqWMJfz5MV6qVSZyeSJ6x
	CiltTqoBr7SQOdDq1MxrLWmxGa+H4TN7CftR+ufY8ImFPdyV1zQmJq+GtLKDgWt6PjgtlTVA602
	Wdw2xFxKP320WD9CDbn1mqcW6/X71QRo=
X-Gm-Gg: AYBFou0wbtsf/vYV1UuJek5EG5lUl9zRfa3SngGS41phhNuGUGmaEkP9XtREgvdUhxK
	DbMCNwjPa+O7kMh2JcOPNtMWijobqdvm8uD99KshFLYGXERC8ECdvPGzfH47x3KycJ57IlHa7+z
	kGpFs1gTg+8Eziog0ev08fwWkTTsGwaebf0tfRESh53oCd7HttYydMGdCiTxTt/UuvES6mWLCAH
	DvJh9LxtxjlS3L/ZxBbk+84GA8s1ljv/2ndODXqDY8yKQP/nxp5gojCMwbdf+bKA/5KKxpAjtjs
	mvMOTRshFzzwZgvGPOSQX7VbJa4VO6eu/8K4YcsGw6f/iT2cmWG5esbzFqNlCjfIUdmhP5c5O4b
	2IM4sSdlV3iZAzLC55YAxT/RdAFrNBR0m4HFWHLaJvBgowteKVYMDFQdx8e16q+z0I24tj8jS
X-Received: by 2002:a05:600c:3510:b0:49f:ffdc:939d with SMTP id
 5b1f17b1804b1-4a17b536662mr17476405e9.9.1791285225506; Tue, 06 Oct 2026
 04:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org> <20260928-mali-c55-renesas-dts-v3-3-2cf7eb746ebb@kernel.org>
In-Reply-To: <20260928-mali-c55-renesas-dts-v3-3-2cf7eb746ebb@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Oct 2026 12:13:18 +0100
X-Gm-Features: AclHuK9BPf3cilBqj7nThWhC8BNihFPb8g0An5CConkIqmbm3l2wQk6-UbbqXpI
Message-ID: <CA+V-a8sJgTEFB77V=UUXf2d=GLfbEvCbmk8ueGWPsPipr8Dj_w@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: media: arm,mali-c55: Add power domain
To: Linus Walleij <linusw@kernel.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 1:54=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Some Mali-C55 integrations place the ISP in a power domain. In
> particular, RZ/V2H uses the CPG domain to manage its module clocks
> through runtime PM.
>
> Allow a single power domain and describe it in the example. Keep the
> property optional for integrations that do not expose a power domain.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  Documentation/devicetree/bindings/media/arm,mali-c55.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/=
Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> index 8fcc46660b75..3a11d3f8488a 100644
> --- a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -36,6 +36,9 @@ properties:
>        - const: aclk
>        - const: hclk
>
> +  power-domains:
> +    maxItems: 1
> +
>    resets:
>      items:
>        - description: vclk domain reset
> @@ -77,6 +80,7 @@ examples:
>        reg =3D <0x400000 0x200000>;
>        clocks =3D <&clk 0>, <&clk 1>, <&clk 2>;
>        clock-names =3D "vclk", "aclk", "hclk";
> +      power-domains =3D <&power>;
>        resets =3D <&resets 0>, <&resets 1>, <&resets 2>;
>        reset-names =3D "vresetn", "aresetn", "hresetn";
>        /* Example interrupt numbers. */
>
> --
> 2.55.0
>
>
