Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF72242E8E6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 13:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787752080; cv=none; b=Nw4S5veuyOeoPZVnwpuwAS+ZvBPED34p3Xp7N2l+dUUwsRUh+pw3wbPQ/ryfjhAjgYEcnfwa3/eiy1BG5/bgT64a4ngwzAgQXdXjR2ddhee4PigatjFDILa20EeLUdbdBqBrPkiGBvk7j3COxHNqbQbKxnCtNFFhLjiqotu4EuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787752080; c=relaxed/simple;
	bh=4R80M2uSqG8aB/kf7mO/4PkvyywvIIAoS2BoNshLVNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ixjZA0+WZ9q9Gg0vmfpNPMshLoPtfIj7An8/bgtqoRaKzn4VmjqOgh9kSSI8DTSnudvLl554OmfgBsc6mj1ZdI1txmcNujoUzIXD5RzmWJbLSo7j0xVjfJjw81rmpYvNzc+PUiEjuLB/t7IqNgSzbmP1YWfr6zfpBU9/3+k/oSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-782c22fbb1cso292247137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 06:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787752077; x=1788356877;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J5AEkQkjMT9TtrBnAvVUmmFOsLJwXzQTGULTsLF/WhM=;
        b=hI/Qw2CsbI+NNJ0CC04Vn9dGCWSS1jWkU3m8OKwNATLk1skJg1SwqIStYPQy1tsysZ
         tPPSDBtURje8EmGF04Mn0AVeIzKopS63mqEtbw1ty4IYZzJk7nmSjwQeZBQb32giE9bQ
         o5aGhYn0zd8piiwje6G/Z0Rj6wArgMmQpGDASX+kPUZLvWh8bFx2VkruvQ7gUIAUtk2P
         bly0g+BglmvsGOCbxB2nBcexsDpqxP6xOkHAh00GWPQqcQiS3Lvq8BdNBSrzsztkgFrU
         PzdOiYGmCTw429cX3LF6uqML1HmGAdJzcwvTfwMKiTYQkVj8pHnXB2hxoTEgDwsDClXz
         8+7g==
X-Forwarded-Encrypted: i=1; AHgh+RrUO0F7D2BN1SlMJh5i8n+A4kDYkXo3NKjxG7u/QsKkUobrfQue6y0b0a9hj++gjOzvYNTEdcvkBm+B0WWJ6hlI3Q==@vger.kernel.org
X-Gm-Message-State: AFuF++mjrcLAfQph49blJVCa8veYBJzD/tkn8p+luU09yvMM4SWz3R63
	noZnEVgkwCOOIBSMHQlnN2aO0Qd7Sss7B+ZtWTnOZsQ+RaghcmtjKgjd6zA98FJRWHc=
X-Gm-Gg: AR+sD12RFVEeemJrCIGGlQrYPTlYU5tHYufJIKqvSQNcq1+naC8sy17s1HkmLI/6orF
	WkS8Cn7Hqi/VObXBA6JyHO7Y0sJ8RLBAwvIJKo79NLo2SH1xGiu+ZlZbxFU5QdXvDGAo6m8jX5x
	oZwOuYCAluOUUoSZop4uJBn2drRnEDlbUHpgUULY+SmhAxwAJio4EM6cRpy5mDVRwoCavRVoL/o
	8VKANAY+em9dDJS0MuVd0mPZzC1GX+tIxB2yrBXDVMCUJhtod8Axdl5mf6veiIXiRyfzuW3wbK1
	bUJodpmZLk12AtQJQmFRfkImg3/OT95/wLixektoTJQ9RFB67RdfepTcuzYNcIMSwoPDjpI8mMA
	VqP8umKYywK6LKOMdBPs9POM2DzCcr3VK1kovyad3Vtp04iop2mtJnpVMMiQ61eIxrhirPxBfL1
	37rdFLje4xlQBpIB7otMwgJDlBrnHAglO0+RH+szU+pCXcpvi24jlZhVouX0aHPQmk9yFz7fReg
	R/rO7ztTG9RrLkcPFck/Mg7tQ==
X-Received: by 2002:a05:6102:1621:b0:77a:7620:761c with SMTP id ada2fe7eead31-782c03f863fmr2356705137.6.1787752077280;
        Wed, 26 Aug 2026 06:47:57 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78305e2914asm1729468137.5.2026.08.26.06.47.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:47:55 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9667ea2fc22so218094241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Aug 2026 06:47:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqO9WdwyP7mKWCUBNOvY7fhkqwK9zta92kaWFLP1C4GXpcuBUELWcxLnSLlTkVm++yAbLg3QweQE50ZPKz+g4gXzw==@vger.kernel.org
X-Received: by 2002:a05:6102:c91:b0:778:721:53db with SMTP id
 ada2fe7eead31-782bca45c59mr1975967137.0.1787752074443; Wed, 26 Aug 2026
 06:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826112821.194877-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260826112821.194877-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Aug 2026 15:47:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWxLXA+Y1sK-AFrx6Z0DkZ0xvrZbqCU_wcrfFyaKArAg@mail.gmail.com>
X-Gm-Features: AcwNN1WNtag92uCqJjbPhiZSsO7JkAmcuVOcn1wehvKzSdLbU4TwbVG4gtD6TYg
Message-ID: <CAMuHMdWWxLXA+Y1sK-AFrx6Z0DkZ0xvrZbqCU_wcrfFyaKArAg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk: Mark XSPI1 boot
 partitions read-only
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 26 Aug 2026 at 13:28, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Mark the BL2 and FIP partitions on XSPI1 as read-only to prevent them
> from being modified through the MTD partition interface.
>
> The corresponding boot partitions on XSPI0 are already marked
> read-only.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -825,11 +825,13 @@ partitions {
>                         partition@0 {
>                                 label = "bl2-1";
>                                 reg = <0x00000000 0x00060000>;
> +                               read-only;
>                         };
>
>                         partition@60000 {
>                                 label = "fip-1";
>                                 reg = <0x00060000 0x007a0000>;
> +                               read-only;
>                         };
>
>                         partition@800000 {

Makes sense. However, what is the recommended interface to update
the bootloader in these partitions?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
