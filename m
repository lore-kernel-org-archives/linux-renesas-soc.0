Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794224642;
	b=SGj7rn3WZKdgL6aSwDN8WETaq0jHUSy07+fh6cD9vE4Sziwg2fQskVkwa6y37942DpEm
	 hdhaMNMnDCqktXclhUWEgALKWubGKWJDjXdA2BMwqhlMF4rYJhJlSCFLu4IL6ZJKHldaV
	 jWI1s1hZ9pkGByoUbK4hJUvbER/rKLxfYeWz6v4kLQVnoQQZPppIdgqDbv0ji1fgkMKyL
	 G3G/n2c8mEFwd5T4iv6oLYZT5767uj1agCtqM2tuhotWXpe+beUNGtIdv3gjuruXANd0m
	 /1Z9dBSzdNVKJ9zXXhPD3Es+FmIthWVMp1sPEwbMu65tkyUztSSU2916GmVa9E1u0tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WhWv9mOtJXvYAa+3ZNJaP/RghMryJmyPcwQFZZ5OFxI=;
	b=eamEACvEXWiC3tvnqL4JQay39IhyZedEh60ZUW+O2mxVovK14xFESQOgwLilvn1vaZSW
	 mzUEISi7BFtOOCrYcESgY9sL0J4Fkuuez4RjPT5KxHpQiLOd+g7NB701MsV8+7qx+GJpR
	 L0J0j7KGP5DmrRWpyULt8rwLF34DY4Su9V/66QKOAYTvRP1AvSohMB5S2dXUAuMT6QJe2
	 6cpDSBikBicuYfvnElIAx8kxP6/cOgi+y6Yr+pZqiWx+msq5uCnE2cIQho5wGKi3zHun1
	 oAQgiYURj1eBrEA1zh4FXkff4nFYQHyWSrRbgg16VU6ZCLEizsGB1GwQciZbMGmXpDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6okdZlf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D115606A31C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Nov 2026 11:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D115606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6okdZlf
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b4f7d3cd98so850955a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Nov 2026 03:44:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794224641; cv=none;
        d=google.com; s=arc-20260327;
        b=GoOYpMpviUHRo8IH0jpA7pNQRra+aZEYgd4YsEj8L+tjqf074OfyI+YGl/10l3ofA/
         TYrhv/Yj2ky7E6kvAeRMg1eaR6xAAaBAeS7oFRot0K4SDrdBQ0lPEAE4Q3fP5ff//Otx
         66Qb2J+4J6p375CVmvFgj3/Jy4wtCAIjhHEaBgMYgY9cK1JLN38Ob8gnzo0CSUszHwA9
         w2B9UncsG5JXOiI2SCOE5Fpg6VKAMEFwfBxc1srOl934iG5mWmuq6P1hcUF+mq0XuRq+
         XZs5TYDL1pppFphYgEiyhkaJ0DU6aFtyn5E8fKMnDaIB+NgrJ5B6jb1mGtRcV1AENycQ
         zSWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WhWv9mOtJXvYAa+3ZNJaP/RghMryJmyPcwQFZZ5OFxI=;
        fh=1jW9KbZDOdYCy/C58CsRsmEJdg5CozB4TyADImyiIlE=;
        b=T+j2CAaYoLlRsd5bau1ykWxd4XFwS8ha4KlLrqQeNI/1nMBQ/55dhs6QCm4w25KQy7
         W4mXKdgPegg/6hKof8D4In2ZDW2XYHjQ3vsP/F+XWUqdp23hwS03W2Kp2pFvKO/eRweV
         hlszwJ9GquJ99AjdBOnY+9NCLGPQ+SpJnh3nJkmtS6bB8kYht2nnIho7PPsslyxjqza0
         FmCJNPGu2vhddWp0CtJF9YEx/V5fHDJllkKAOIM0PVpqkAMgfmOqvkvLfiLH2EqXjwh2
         w8lP7cr8iTibZg7T6S/BPOgTDXQNw4yCVJ/fyj8lnZSUjajY2anbgNVuXwrEh0U44usw
         yumw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794224641; x=1794829441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WhWv9mOtJXvYAa+3ZNJaP/RghMryJmyPcwQFZZ5OFxI=;
        b=m6okdZlfk4ExGZf+uzRIPUoz1J8kEG9CRr9st+oN2CrSAzcerKYmLR1TPOqRbNGaho
         b9Zly/w8mdiKPeS5/UlDyGpN+DXZ6JxHHJgUsNEjHq1IxET3Xwag3mEqYJOBOuWp+9mn
         AsJp8qjHtwb0tOeHy4ZW27+4F8ga0DkXk4ceBuj0gdXt5Qk3ecoNhUkfCeAHh8qvMKzJ
         nVDFGweYxd2OZGWJKGk1hmYhzHUoaDqnFa3mcKHCZJ+Go0V//t+L8OsJjvaRuCLMEbKJ
         0Goo79jAoJ9FOpTS+meQpapZj4ojYbR/UoXqqjXAKVZEwTFTQk03xDEtGBI143e0KrEg
         GQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794224641; x=1794829441;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WhWv9mOtJXvYAa+3ZNJaP/RghMryJmyPcwQFZZ5OFxI=;
        b=X8TGKFOK8UA2UXaTqH+OOwYPpaJEpp4PcyrlGnCwAiNQGE7nUigSEb8PFi5JFWVH9W
         ZLQb9C+svxoaMllkyoUzzaC5A0eC9hsOT9ibgmRD1PuWHiulN1gImLunix6WQjj77unF
         A03w4PttIOo/lo65O8501jAjKtU3KmUtfOt16ADW8rP972tNwiZ1CjHMdYsy1tjaqm2h
         xmPFu3EHyIw3+2TDM5KvduQjy4SEnYTUtQNkh6crTBmxcKAa4D2+zZBQhqZl0/2NMob6
         wa8blS7dl2a3Uxn3wNhd/jUmBFT97ZVeurGMv18nD44Fmq9P+PsqlTGDzF/S0rrR6Hfc
         iY2A==
X-Forwarded-Encrypted: i=1; AL+hErFaaPfAWCVuJ/jp7nj7pKHrZeyofl7lugsNl4eAuiQ765gnBedizN1wBQjTDLmyv+hP7CuFXFu7rFjUT39UordVew==@vger.kernel.org
X-Gm-Message-State: APuU4Z8KQ86lcUDPyFPL2m0NTj7f6/wQFVuLIJiA7M8bnZ6rmw0k97ES
	Geg+DVpDG4Kxyi+Rvv0mSYVI/WqWQ97sjYle8y57jZEQ91yUBqf69MDmz1Fwosih87KWlPaSqzw
	6yi6+UsTQ/MUAOKYGr4Pj6jZR0P4snYczonKKStFYrQ==
X-Gm-Gg: AYBFou2uSUS34RdCY/EYBdlNi7nJPDgsGwLwqDafVaihwLNzLHhfF343ZtMPp+MQnNF
	2RiZTxQlf5NPwgrVfdOF8XcMW9e3BK9vBK07VRLLYUQjFVc7WHtvZogzK8PnlzdT0vQ/iAGy3Ip
	qvuLPCYPtrUtulKTzK0hyPBihh1+gavo7wrWO8GO6Wsxki46hQZU8lYBZsmJJS5QDR5gxXGqnjC
	gS8es3btCjJoxHIAyoUnCvrp79H6C8sqyJyKavZbj02Dqf/uVk2IT1i1BCXmCbWsAEl4JNX6srs
	2JWT4cN9WNykauyXk+Cf1TLFgDUZgyHU0Sv98PM+koe9ajZm8/ucqJ/+ogWTHjENlXsyD8Bhz61
	iZVAXGc5idfqYb8AkS3ZV/s3rrackSkKGCBXA4YKxRw1reKO6RW8/JtOnJzA2PZYjli+6/1mhNU
	qvzEEuLq/OmqxMOS+3rQXnRgfVKkF4Yigzy/rIR2l0ZeCuLLPVOBnJFSDkcg==
X-Received: by 2002:a05:6402:1e92:b0:6b4:be3f:51b3 with SMTP id
 4fb4d7f45d1cf-6b72240d6cfmr2469174a12.12.1794224640696; Mon, 09 Nov 2026
 03:44:00 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ca5b7840d5e2ed20b06eed3364b1427ba67cbea0.1793798520.git.geert+renesas@glider.be>
In-Reply-To: <ca5b7840d5e2ed20b06eed3364b1427ba67cbea0.1793798520.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 9 Nov 2026 11:43:34 +0000
X-Gm-Features: AclHuK-bJj0n7rOL0zi7DpeCK8bn6yRlm7g53dv8t4IqknrcBdzi5b1lolLjAMg
Message-ID: <CA+V-a8sfSBUJueV8Kw7_H9GDDDvaSjZMy1vJfYnRz1jOKzzwgA@mail.gmail.com>
Subject: Re: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v7.4-rc1
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 1:29=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Refresh the defconfig for Renesas RZ/Five systems:
>   - Disable support for the SiFive MAL-9092 erratum (not applicable),
>   - Disable support for Page-Based 48-bit and 57-bit Virtual-Memory
>     Systems (not supported by RZ/Five),
>   - Disable the RISC-V RPMI-based Device Power driver (not supported by
>     RZ/Five).
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not intended for upstream merge.
> To be applied to the topic/renesas-defconfig branch.
> ---
>  arch/riscv/configs/rzfive_defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzf=
ive_defconfig
> index a5d9622c47a00146..cfcd3f6a95e63a53 100644
> --- a/arch/riscv/configs/rzfive_defconfig
> +++ b/arch/riscv/configs/rzfive_defconfig
> @@ -27,9 +27,12 @@ CONFIG_EXPERT=3Dy
>  CONFIG_PROFILING=3Dy
>  CONFIG_ARCH_RENESAS=3Dy
>  CONFIG_ERRATA_SIFIVE=3Dy
> +# CONFIG_ERRATA_SIFIVE_MAL_9092 is not set
>  CONFIG_NONPORTABLE=3Dy
>  # CONFIG_RISCV_ISA_SUPM is not set
>  # CONFIG_RISCV_ISA_SVNAPOT is not set
> +# CONFIG_RISCV_ISA_SV48 is not set
> +# CONFIG_RISCV_ISA_SV57 is not set
>  # CONFIG_RISCV_ISA_SVPBMT is not set
>  # CONFIG_RISCV_ISA_V is not set
>  # CONFIG_RISCV_ISA_ZAWRS is not set
> @@ -174,6 +177,7 @@ CONFIG_RPMSG_CHAR=3Dy
>  CONFIG_RPMSG_CTRL=3Dy
>  CONFIG_RPMSG_VIRTIO=3Dy
>  CONFIG_ARCH_R9A07G043=3Dy
> +# CONFIG_RISCV_RPMI_DEVICE_POWER is not set
>  CONFIG_EXTCON=3Dy
>  CONFIG_MEMORY=3Dy
>  CONFIG_RENESAS_RPCIF=3Dy
> --
> 2.43.0
>
>
