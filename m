Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1105F3AFCE3
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Sep 2026 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809996; cv=pass; b=VAVqFoYe5AETu2m7KufFai0tQPRV5BVH/is171P7DGFowK2/zXLmbcq/jEdkf7TJoUb8X3+7O63hzs9JbxNQOKsGyxcszhKndyP7yGFwOAbTyn+Il94Hk9TPOwDfNqsYecZOXG2FMezwTyqefAuKtsjsqGG5bto4GKhxMVGvKtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809996; c=relaxed/simple;
	bh=gfb1OFy6HnketlAtt5XqTvEazZ7wrq8ZI6YrMsSum2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ACo2AbgEVbIPj2ai3x3STeuIcTHXi2v2z9wWcA4VeNJn/HKohvwwUMc32nIWyTdV11WU7jOk3Nxzy8RbYkNBaJ4AHe6+VFjeh8ts89hzc88Oyu2EUr1HO5bDlv7y6vlUGd4y87yCfaNAzExfjsyo5iPjgWfamen8Q5lQqzGLaik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ppLTYMGu; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ppLTYMGu"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f96c5b722so2702736f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Sep 2026 12:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788809993; cv=none;
        d=google.com; s=arc-20260327;
        b=Mj5lgFzVjS5fqRBru/av2rnU4zotkboVrglZoObA6mCDrENNtc5VMjLgiN9Q7P2Dlb
         bEhxq7OrNx8YH4fcU3GFblqQjRhigNstW/L21/Kxo4Ti0I9iDvNGrhAokbkfqtiDyCre
         irI5izTQCDhHenN7nO0sNywxKVL/gAShmcYjT0YgyM5W4p4MF1XengXsfYqxwZApN3Oj
         n0JyTJBC+e99SRBPXXY7g47cPhRrJU9eVskA5Tib7qLzn4VWnz8rUYjL0VB0t/gQ1LHR
         QaZcdT8DKL5ktcAMBg2y4uCY80buCFtNUnZpbzhYIzqu7/vYxbXd0BVI0qpgAfyHvuzO
         cpMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UbTECHpg/c3ZKvu0s3KVwXXekuTGLp53kt2aih8Xec4=;
        fh=mFtlltb58YM3V+001O3vKxP2DnCIiKd10Es0CppBQQI=;
        b=LrFSAo8H7xrBUymE231azhyYtq0BfG7TuJAtYaVXsBVqdIlShJjbxlC/8lglSydFN2
         WYyHQG3SqQDyVFTuC3a9BP8KhQeO9rRE33LljOcrssVmcNj4XyJPlmNOc+Z9Fr0e1f8M
         SyQMehqV4vtWQ+9YURGxu8PSYIlGqsNC9hLylriH08R+SXA/5BVtxd2aBcK9qcPrdUCB
         oDtEk5C4KuR+V4QasRDGtLVna5HRMz4Th+Af7XHk6wzns9i98XCBZ7h+0i7rRhwq9x3V
         5OQYF7ec9wnwR15E1c9ci5QPblSMY21/2zfh5Xaqt2bhkiz1bRq6f3Sep5C1UpwHy7Qk
         r+fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788809993; x=1789414793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UbTECHpg/c3ZKvu0s3KVwXXekuTGLp53kt2aih8Xec4=;
        b=ppLTYMGu2vSdw0/65kAKro4AL1aOex0UDW/GtT4vRTKXPAH4lFCzFhLEKjre1vJO9N
         zn9CdtoHfF+eJMyM4cIhjoQG0klhZWCSt0E938vF17zVjHcSx30fBLFSp+EpaFqevFZW
         7X5UjSf22/CcOsAmxyEnVxq75NJR3A7awvZPJ4nlDVpkGHAe4hQmmuOxXFBipVHDPuqK
         NJte8q/uP5b9KhLA7SJUvc9IgokZyhXgcsuS7eVSvLUxIsSFGAhwPwYwMG+Ryp9YTOcl
         tar/3MhjurwOtcou22/8mTkOusDJ7phk3YINcWQUf4I6QnqC02xXvwLwA3+qXcUWxBbo
         W9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788809993; x=1789414793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UbTECHpg/c3ZKvu0s3KVwXXekuTGLp53kt2aih8Xec4=;
        b=lU+A+7/yMNwM9xQbSdf3MMWZApAWcn9WuenAf1UhUx1yIHmq7QMvAUk+0TxadhLv0x
         gJKx3KBudr5T2sZUOrQVk8x37vhvQyU2JCo7QB9g10mcYXF86XH6z1O5JBhJhd9qXbZ6
         MlNv/ROaIVV3Yb1GWpLcYMtrAN8RB6/dG1clWaon6Z15XC0tqlD3uovO4FhPkycqu0Zs
         gqT25gFqx5MuPq7UlAHmaNDAFlaz4qy0zB9fNJt+xoBc1rQWJIBwtI3OxYAuiLQsZ5Vw
         HFhSKuLQt+saKJhr593qNLN5l9Ua7uS5nslGru+7VqTsKbBKHUW4yqJ7hhhyvETG1kGm
         htYQ==
X-Forwarded-Encrypted: i=1; AKwUvByA5dTiMe7RADYuGNBKOEiycrZ7++C6PGAxlKUPyhNIgLsF2rgzMOfjyp0XAO0PU/92zu/TtB2sh6nsvF3pY84iug==@vger.kernel.org
X-Gm-Message-State: AFuF++kc312us3vwRsQp04Dbd6r3WeP3QAdV3GvShu+UyNOrguxwmtDZ
	POYcgXpAP1OGHht2PVe+XagiPmPAANxBZGZmtLWaZ4zNBguvqlnEKLvQ5+lneSn0QG5KR5u/08G
	BJRnuPJs/yLFHwjVsCWLmrHvzXKs+3Ok=
X-Gm-Gg: AYBFou2bKIDAEuhkjCR0CoSbJNMDuV15mdk+yUFL0Q3uEJKJEtzfEourd7QJuDPTQv/
	rsWxtyitP37RA2m2f9j9S62WArsvN+7vF/VWuZ7iR59VIHw+16uBsFOYzESGi5XFLf5+q3oINdh
	Ghfy7P1GydXOKnDjoPFcSqkYaTZUyRVAV7y4n6tGK1kY7VlGpRW4AJ4/tt0BJlLeWSBkGlsvFlP
	Xm1J6o2HUNOQcjLlRFaZ0Tzk4E2rxZ1a+gyo4q58LdBcl5Kuu2wMCMpYbxJO7XF9yjxBbXHYcjQ
	obSPd7pU3LEnnrmJhVPiVTo6+ycyU3qS4Qynt/616GCwBVZO5sTRv+Oo12hdtOfsf+sLjEtGp6f
	r2cfIwD1RmY59z0agxDR+zRwKuupszn2m
X-Received: by 2002:a5d:6f08:0:b0:485:8a47:5b8e with SMTP id
 ffacd0b85a97d-4858a475d4cmr24045312f8f.43.1788809993301; Mon, 07 Sep 2026
 12:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-rzn1-miic-fix-array-v3-0-3f7dccffaf5a@reliablecontrols.com>
 <20260902-rzn1-miic-fix-array-v3-2-3f7dccffaf5a@reliablecontrols.com>
In-Reply-To: <20260902-rzn1-miic-fix-array-v3-2-3f7dccffaf5a@reliablecontrols.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Sep 2026 20:39:27 +0100
X-Gm-Features: AcwNN1WqIPfZI7d2ltyP8smilE59YQ5lZz8X2iBCgOL-jJlaLFlqC46GZV_NYfo
Message-ID: <CA+V-a8tOLKxFEKF+yZ0Asf_KYb=_hrFuJagkdzHPxZ_zf3MNRw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] net: pcs: rzn1-miic: Verify port number from dtb
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

Thank you for the patch.

On Wed, Sep 2, 2026 at 7:55=E2=80=AFPM Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
>
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> Add check to make sure port number is in range before writing
> to dt_val array
>
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
> ---
>  drivers/net/pcs/pcs-rzn1-miic.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index c50b65d064fa..3ee40eb9d545 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -692,6 +692,12 @@ static int miic_parse_dt(struct miic *miic, u32 *mod=
e_cfg)
>                 if (of_property_read_u32(conv, "reg", &port))
>                         continue;
>
> +               if (port < miic->of_data->miic_port_start || port > miic-=
>of_data->miic_port_max) {
> +                       dev_err(miic->dev, "Port number out of range: %d\=
n", port);
> +                       kfree(dt_val);
> +                       return -EINVAL;
> +               }
> +
Query to maintainers, what policy should be followed? Since the
dtbinding check complains if the port is out of range should the code
also check it?

For the patch,
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

>                 if (of_property_read_u32(conv, "renesas,miic-input", &con=
f))
>                         continue;
>
>
> --
> 2.43.0
>
>
>
