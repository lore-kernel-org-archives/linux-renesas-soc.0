Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794180012;
	b=TBdItL42F+8C6OOfhZsKykWA047N1FHQGmSA41NxKazR23hmit4moUkgG43fdyYoOAmc
	 ZLjyLH3rkHwPxuh4LCOYdMRCbaZE7RU0yB3WgbN+s1sgq7+o/WEJjD6p3yeAo6o4lnedt
	 okW1WcDbxHDWEHrDJky7murMPGpPs/5tgqefslkXTrj13PDzrONYZZxygOfAz6cuSR5yE
	 ZJ4OPEZI5ELmzGfLVRvwpYxKg7jjbXhqcjffooqFamuvG0/NT+nueHU8RgFuT2oLu+/3G
	 L9tBqO7KWEgt+ObFFuu8sT8oZv2j2dbjEvaPIc9FErk2/7TMyvm/RjWR4T+Feo5sJSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794180012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m1/J7FILflciOoToVoalj4BsQPvxpTrXiBsxuDEywhc=;
	b=feZ1wlHOFakgBaxs9ymim6lkcSPaohrQHsi31d2RK6STBbCSi7Xxdvkvlk4NEY9THbFQ
	 Ce6rPoDdX+ektqS71kav29njxkjGH0mNBK5YLZzltp3lyuSmvEwjp/fvzo+46XqowH974
	 6VuU0s0LzT8Ox2sOhAC9JJ00IecZFirWO/qduYWCrfPca36TNjJxSVIxDz2NBuLqNhrru
	 06ERNmtmypgSC9QH8JrIcVv4jovx3JPi0BlzIkLrgnW8quiGZcY5BvjsA5MTKuyUz3fqf
	 T4DUY/gPNxH4KG+i+hcmBYqVr7oRutEkPIW94YE7tahvwl8fAjB558hW6QI6lMXiDlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAhlCpXE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC26606A31C
	for <linux-renesas-soc@vger.kernel.org>; Sun,  8 Nov 2026 23:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EC26606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAhlCpXE
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so2041865e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 08 Nov 2026 15:20:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794180010; cv=none;
        d=google.com; s=arc-20260327;
        b=XiTbfnOhaiVHAl5EyITLkrUmB2UYbnnHqvAfqkBZFofGiU6iQFL5V3FP4EhIMGAtuR
         qKe5pVDEnTiXsBSoJYteKtX9KlMi8nxVEsWYS3TTg2algaE5CAmI0V7BFTBsNRp/Wcgd
         KWFx+i0JEoLAQHjXXOOtxiw6J/EKdscNfTWgGKRe1eVy0ja5+5FdVdSgwjoIifReEybP
         DdcSswdHEVHnfVmjJ/amrYXEB20SL/vLsEpjHT8p2V6+BAE/PDsa3JAUbVcQ3NyTV4Kq
         6OJd8RFOwtMbgQGlCPAkjRhzB49qz631JYDmA9nWJmxDX4C6CzlKtjTb2mevkic5bPg6
         KcKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m1/J7FILflciOoToVoalj4BsQPvxpTrXiBsxuDEywhc=;
        fh=mGK2wrGzbtEfmC3EX7sxgtKtOARkkRrChU2wck7WQJ8=;
        b=iUiVDLf3AIiMAlaRXDvIliNHdBBSkaNDCfaBPsCL80nY/2OO6WhRWzRkTqNf1TMftp
         7SKUInSvjQLSQwVdvoIerdciDxdtjOgjvbTnSoFP/vBBeOF8R9cBkWVvXDS+Zj/MLgEC
         7RdKW0uxBgNl4XUkrEPqPuJVkYuOKK83UiMyW31KDsJ8j+y93WTcxKXLXZLIbfHIObnQ
         WLeiTrf+9ULFdZGbWEvb6x3agNto57PU8WznsKVCrxZWQhUybhWOHjw2xRHYc7j9Cz+s
         uBjTDCCn5I3jENFe9se/CaAWA7gzN9tRao35SDNuDwKnqFDjgXLkaWJCIdSYGVLA3qDd
         T4vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794180010; x=1794784810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1/J7FILflciOoToVoalj4BsQPvxpTrXiBsxuDEywhc=;
        b=lAhlCpXEiXASYRloUapxnVgOZqNx15wmVSKgWZ8akGJ4kUaEn6DAOTuCHm5eKqmTHF
         QRcGAs8vmuFNj9JkYROTOtIjaxokwOKs/XPW8qXsHG4Tiyt6MFBBTdrXjQQDlaN9CMVY
         /Wz0TqoSYViTG6BEMvfH3K1+0jAkiDz/HXBbm67O47l0iJ59r02hZ+i2Ckzaj7ZLdmk2
         0n1jMYhE73+arXCQiPEW0wXObD96m7S5w8QeVLRcMQMnyDUD7ZgzmwqUVvIBWSK2+3ZF
         j6KZPZp71iSiMmR1BWDmAoD8LpCH5CNRxBhgRbZjt5jG1l/affRoPGLcBmWP1C/FJimg
         5x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794180010; x=1794784810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1/J7FILflciOoToVoalj4BsQPvxpTrXiBsxuDEywhc=;
        b=tjQLK2vEKDHEGRUwYcrRLdCUUNg19HFtBzjotvPqGNnVR0oLmcj8D96fXC/A/pu3WJ
         IASC35zhSz9Om/CdqHtg2/69UUW/tFybvQ3BIHOl2Bm322trQWD4TRGOnqgUUNPx5bAL
         4jsU4SvvKWj7Axdra/0Pv+bYKMtus2GhmXL5xQ3os+z8yCyXqNSkWwUTNsvMH2xRrRB/
         1/WaawZV/nLDnvqvA5lHauJmE9XlUoZbj61tQvR6oI94qFVBum9d4IHSyvP7J2X72sDS
         WE8cW2+g+BVkciysOhO+falH8VEupFBuQXAsfqIDY5AU0e/3je+HiZ7Ag8SxKdxmrPA6
         YJvg==
X-Forwarded-Encrypted: i=1; AL+hErFJmOqR39VfiU3PS1Rig6zm78nWAYPcSyzVZ8EJyqZtV8E0VQ7zcEjP5yzOIrw3s3CIgmyGLH6yOW95kt0PcZ+ToQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+5M7rnlw9aTb7N/tAX5FoPQT2ZfS8oAnagpSud8JFaiX+eUz/i
	CQXj+3p7dZMN7KX+yRft5IRG/yPgv6IUezab70dVy6abypLHeyViwVeFZiQsyvaGl5weUifVhTZ
	A2pOfjHrkN7do50omFGm3B3+xbcjNulA=
X-Gm-Gg: AYBFou25DHQh2I5ypdNc1Pbdm1jT1llACX5UbZAndjMNVYcBA42Ek4ofxZkqwKIAOZx
	BXB64IA81mTDI0K97NCHASmKpxkgQUvqtuYq0eiRHH8UKfdN9S4uOFh492ANdcInm4h1Uzz/+XY
	hKoXOU9c6QRgG2OkQzIKsxchJUCp89pJZ1C9SdnR4jbJC5ceMq+flvuvG0WGBHWjnWA/6CmJaBC
	yosHmlS6/itCMzgfFpnr4pRO5b/8bw5plb3DRLmHNuXgbaU+G6XHH8O4NMrNzeX38Q9bfRDNZJY
	NgVOjEm86zdo02q1Regy3NumkKN2kOuVDT/hl7k7t8XNxYFoZLvWyxfTJjsgGnP3SZq1/ZRrC+T
	CoplqDcTvhCeFDL4iB5CtU7Axvt0gnT3/JsXZ4RRkRG/F7BMkwn2/11d3seZEiVnCvga4D46lUj
	AlWPnutx7ruBzydeymXF+BQIAn5eckhLjG9kG0wZNeGBHhNhaGqyZzgzYIJng=
X-Received: by 2002:a05:600c:6095:b0:4a1:fbf8:55c9 with SMTP id
 5b1f17b1804b1-4b963c89227mr39662885e9.33.1794180010333; Sun, 08 Nov 2026
 15:20:10 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de> <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
In-Reply-To: <20261103-reset-regmap-test-bits-v1-6-1b33607a76b0@pengutronix.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 8 Nov 2026 23:19:44 +0000
X-Gm-Features: AclHuK-aeVO63ZKWXARmCrmFPccfQkZVnuibMmil6eYfKAtCJR8zv2owsIJ8nxI
Message-ID: <CA+V-a8tDskFKhsJJiV1OUXEzcTN6nKEz4DJCPjJC2tEdrCUTgg@mail.gmail.com>
Subject: Re: [PATCH 6/8] reset: rzv2h-usb2phy: Use regmap_test_bits in rzv2h_usbphy_reset_status
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 2:52=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.d=
e> wrote:
>
> Simplify rzv2h_usbphy_reset_status() by using regmap_test_bits().
> No functional change.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/reset/reset-rzv2h-usb2phy.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rz=
v2h-usb2phy.c
> index d96042e28cd5..e644092cc2f7 100644
> --- a/drivers/reset/reset-rzv2h-usb2phy.c
> +++ b/drivers/reset/reset-rzv2h-usb2phy.c
> @@ -68,11 +68,9 @@ static int rzv2h_usbphy_reset_status(struct reset_cont=
roller_dev *rcdev,
>                                      unsigned long id)
>  {
>         struct rzv2h_usb2phy_reset_priv *priv =3D rzv2h_usbphy_rcdev_to_p=
riv(rcdev);
> -       u32 reg;
>
> -       regmap_read(priv->regmap, priv->data->reset_reg, &reg);
> -
> -       return (reg & priv->data->reset_status_bits) =3D=3D priv->data->r=
eset_status_bits;
> +       return regmap_test_bits(priv->regmap, priv->data->reset_reg,
> +                               priv->data->reset_status_bits);
>  }
>
>  static const struct reset_control_ops rzv2h_usbphy_reset_ops =3D {
>
> --
> 2.47.3
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
