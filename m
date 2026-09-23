Received: from mail-vs2-f24.google.com (mail-vs2-f24.google.com [74.125.227.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7915A47D922
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 09:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157532; cv=none; b=Zx/zB1Isc+E5S8qX3nU6bTVScQY3zbuNvrQCi67UodfIHB3VIoNQFwtJrF4QHRg12VcBD52LYd1em3KYfEF136pj2whD7+YePZPoS3ygEY9WVW4TlS6C1C41PjpHWvMLf7fdiqjR2cN1cAwG+OzqWm/L73p+Jla+lOwL+7KeIVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157532; c=relaxed/simple;
	bh=cgQKrK3Rqkd2bXNMJtchWvRqmw6rrHftcmd6IPygYd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HXUcpF8eAgKh/POq/JMI1y7nqISawV26g4N8VVceLL5Nf2TOcEVpiUtZ34rLHIVqMToCvsfvKYP98Hwkq67YiF8P85LRwAC6QTbvJr8xXfhCvVugUf4j1zGG07r1uOURMIX+nkH2BIfb7Fy9PHj3hjC5vw+N0/DG+fiQUXY4iw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f24.google.com with SMTP id 71dfb90a1353d-5c97b28165bso752297e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 02:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790157530; x=1790762330;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fOsjR1C8KRldJmAM/WaBd8dcZ8oAMqD1v2iQK87wQ/8=;
        b=NdNk+bYHt2CZIjPEZAfRDsHAqxQgtnbyBluFjNDCq1TzNFBLnTbXyPZSKJmZyTSO6y
         jAjIh1M04K/0ZA+nvGuhMH8zziGRI6pxJlbK0lmSRT6oX1poY77gEuZu8JP086jVMkEg
         3BYWWgVVEcXu083U6LZCKpv6Q0WnRIns3dx5ld6vJJQWeCb8eTpsLk5DMXZ1QaPSKS6L
         uUNjJiJvPh1wau/NraeghiIgB4FPn2mvIa3CqIqjAcFMEHQZUnL4GlmeF+MZxiyHyhtQ
         LBJxanSykkPxmWCyFGcqKycJZVYJu7JaYIW9YWqil0fimVOZgWYzmJGVxj3aIc2LaQ32
         3tcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6TmzOFmFuqfceofU7Dh4m/ZL/SZFkS5mDvzqHj9a14bqLBFNK9FUSzgt/IiOA5ef6BCJQAuTRf+t2d6ahXWSklQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nhf4a6OnYOl8KmBBN+oGQ7DMm/N1C/aY3VWeNddi/eLt5Swjrb
	AplLrnkh1m83IRDjXBeEpXjclHxZtNGn+TbDzkYgy6mcIELXSh8V+ec3cNiI/X4DIZk=
X-Gm-Gg: AYBFou1wneWRhz2LkWeyQcPQTkdAjx6gr7M7il+zzSgrq7kCFR9mqy5/xgH3RrHAcsk
	uMEXjp/L6xXVY2fGmxHLg0pBADFT8UQxcLVYi3ZyGxvIePOW6kFHpo4NkoTOJJ+016NIeYke3k2
	TETHfRmaxhNaYt+iDfpttPoOPvrI+21bmqTU+V3UF0/MDSiLhomHCbEAp4RIBhy1UZEB11LpMtu
	cdHKmhYOCttKYnLB76+ZxT2gPrXCuQEDbRDvMGkMh2/8p8FgWRbop+BZsSm7Ej3qh+JFjsVic2V
	mWXQ5LwYD+E88k7e3bqwi96nYmrIrSgZQ0unS3OMwxN/Cj6BavUd07xUCkaqJ0MEOZztZ6VJ9px
	H7vj8I+M21G/uR3oocfckyR8fBSLoSXvVc3aCMVKRVehjB8KT6t0muJrlTLNIMeTDifyYFrwsQE
	UOxrWbjqkY+K5cvExBgGlJnjcu8L4csMCizkI/jfrNkVLRPpeRXdteurL+AgPJfcOgNmPFNMp8z
	vSRMW21E/Ui6BKzTKc+P6hQfcYQ3rVq0Mwx
X-Received: by 2002:a05:6122:3287:b0:5c9:a60b:e5a7 with SMTP id 71dfb90a1353d-5c9f15d1f70mr2624349e0c.9.1790157530236;
        Wed, 23 Sep 2026 02:58:50 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ca2876229dsm825255e0c.3.2026.09.23.02.58.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:58:50 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-7856441f7d8so420323137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 02:58:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwA2SqnCohWGf4AKqrUpSnNSSG5w+rGAjxegLNu5R9SQBB0t00ILPtI6CutihPCGfgTn08+ZdHBtKhmPfrhdUPEPA==@vger.kernel.org
X-Received: by 2002:a05:6102:5493:b0:7a6:d3f5:3551 with SMTP id
 ada2fe7eead31-7ac1ba3aa41mr1865740137.14.1790157529595; Wed, 23 Sep 2026
 02:58:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org> <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
In-Reply-To: <20260922-mali-c55-renesas-dts-v1-1-cd63cdb51033@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:58:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
X-Gm-Features: AclHuK-ZLnADC_yQSZhQ6KyATq7TTVujDV7zLDX1BCp0BDcquLjKrWDdI_wG4Oc
Message-ID: <CAMuHMdVkhSNDn3BpBt-9K8FPKhmODYVF-PCKr+AH8B+o4GHuJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
To: Linus Walleij <linusw@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

Thanks for your patch!

On Tue, 22 Sept 2026 at 15:34, Linus Walleij <linusw@kernel.org> wrote:
> From: Daniel Scally <dan.scally@ideasonboard.com>
>
> Add the Input Video Control Block and Arm Mali-C55 ISP to the device
> tree file for the RZ/V2H(P) SoC.
>
> [Rebase onto v7.3-rc1, place the nodes in address order, and sort
>  the interrupt properties. - Linus Walleij]
>
> Assisted-by: LLM

Dear LLM: Please take into account the review comments on the original
submission:
https://lore.kernel.org/CAMuHMdVCeMaQ8yFnMgr1Nko+0yQxn69BR9fGJ2WPvADMc2gvRQ@mail.gmail.com/

> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
