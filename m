Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A388F345731
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170637; cv=none; b=CCO1YqrwyfZ2Xnf4Thb9+nNCFeS3nhubtIH/+7R1JzEMTv1WatGpFb4wI6LL9E/lK5a7mwq3MyeHAB+G3qiI9rqHaF81EvN5wj9E/WdC+8ocvhqjRjP9qya/W0FUiPtCt5AWBtYBQXrHoGMutaC/8bQCnSOf80HuJQD2jiMQblA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170637; c=relaxed/simple;
	bh=GQjYyGJqtEMPVm5k60bgH8AnQwwtqy6vM3m2t8/DQjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIkvg34KeHFKacHk4JVEZ+iczPwlXSNpr3pi75D/bB6jYt324ar5LggdHJKd/WsBZ6fBeMF71cgin5+q+XJb5acz5FxhYj/jQFGfUTOorhg4Ed4bVmWBUsPBzebL148Yk/jDABxZ8IK7YNP8VLzDv/aB+BQlEqX6Pk8x8tczyis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59ecd51117dso516080e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 02:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170634; x=1781775434;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pxl9qNx6mScAKo27Qf31OCUdFE/UxFOZhTWyYV5PE4=;
        b=BmFjl843ex+izN9Ut5Ra6cJdubIqkNtX3dr0W2eb7wySxQGaD32GPCBodKXqAr020+
         DwECS8JmfP4105T1rl28Mbsar5geKSU2p34j/oCo02YfBIwXllmSe8yJ5rFsvc+ZK71F
         cI62HBHblQ3orASUa+S1jqNpWQz+1dMi2Ns3uoQEA8s0/vyCXyBtIFzasSWZZtWGNYkg
         SjzDHRCNJrEAhpazdhG0ut9t/iS7NGqzo7k0piK8iNJH7M4eHUhhGDc8PGvrZ5kHOgnf
         7IEYx+79QHy2/bCWWQRogm+VAETRzPGXOACKHfDfgDzkyx5Lj9XeA3uojIQUZB2pj3p3
         xRPw==
X-Forwarded-Encrypted: i=1; AFNElJ8ySnnOnVnBHahUuo/GIfwpLIjGCKnYmB68NA5MZFJYgKDDUpll3U9pI79g6Mzmaacv/9dNNebHi+ruWx0HK6MQCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoRG1OCGVmqzqe4paENA9wtQHJ/UYtBmiNNVWj96WFjxsN/2iM
	QqGFBrFAzZw/jFv8efMd0kyVkiQwpAy3CJUCj98TI27Fc35383nv5VKPmw5xQ8jhcOY=
X-Gm-Gg: Acq92OGQK6AxNUyPpkppIibqVAyfVXWW+pX5YeEK2Gbsj0vh8WvF2UtpV+zLPwgM5hp
	VdYqZrOge2O7BFc/Sq066Bfmp0TjIgu4IWcMA09jJcPO9I3E5wxF+ZwV/Pnys/fS7SQyt6CF+LZ
	4hk1aACQLO37KN9mWKZWzihvuC6mpov3attHadJs4aAEt7OfJF9Ddcnf52FVGZ9DPv0I9LxcrGb
	R3gOehO8PRJ3K8OwLBKZFUlHmiyFsiPuE9v25N1IVSGfdCzKsWjqbGGx9mIQU4WzBYzjdi+FgqU
	aQnzxMwQ4j85fLDlFgOzEo4GILcyja7kBmG1i4061V6CrSD+A7lEqosv9nrIlgeVe9lsAGsn06w
	Kt4nGMYtVcjF4Fzl7+kTh6QNYZvn91kBHr43sma8H3OvbPOVqlgEhUrI2/cJvILpmS2KGKvRp2i
	Mo701uczcQj7t3DOpA/oJXhlsSuCZVOeLNAXwrzm4yBRyZJEotOvBkcCBxTxuBdX9r200yKnY=
X-Received: by 2002:a05:6122:1788:b0:56d:3451:4cc0 with SMTP id 71dfb90a1353d-5baec6ed8ebmr622392e0c.7.1781170634638;
        Thu, 11 Jun 2026 02:37:14 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb06a9407dsm915402e0c.2.2026.06.11.02.37.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:37:14 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-963b09d5b91so555784241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jun 2026 02:37:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ISSBAjLTUcOCSALJhA46QGizwZF2RXEE7cmUnQQDKEGie8xigk8CwnOckk7/QyymR5LO6BZOpSi496XupEpi3xw==@vger.kernel.org
X-Received: by 2002:a67:f9cc:0:b0:6cf:2b61:3fa9 with SMTP id
 ada2fe7eead31-71d640273d1mr415147137.10.1781170633747; Thu, 11 Jun 2026
 02:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0a57ab356e5f426e28ead373b809f88a63e55380.1781105151.git.geert+renesas@glider.be>
 <20260611-serious-divergent-sidewinder-ec7ccb@quoll>
In-Reply-To: <20260611-serious-divergent-sidewinder-ec7ccb@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jun 2026 11:37:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXyVDbex1FhkJf_1Xc4QMKvThDQD-3scCCsE+wePpPiMg@mail.gmail.com>
X-Gm-Features: AVVi8CeDuiOEsQzi0FV-mGCz7l2EJP5AYBsrBzx8J8Wiz9IyxZkJS12N-pfg1Qk
Message-ID: <CAMuHMdXyVDbex1FhkJf_1Xc4QMKvThDQD-3scCCsE+wePpPiMg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: cache: l2c2x0: Add missing power-domains
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 11 Jun 2026 at 11:28, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Wed, Jun 10, 2026 at 05:29:20PM +0200, Geert Uytterhoeven wrote:
> > On Renesas SH-Mobile and R-Mobile SoCs, the ARM PL310 L2 Cache
> > Controller is located in a controllable power area.
>
> Interesting... so to turn on L2 cache, OS would need to boot, setup
> power domains handling, turn on power domain and then turn on L2 cache?

On R-Mobile A1, the L2 cache is even located in the same power area
as the Cortex A9 CPU core ;-)

> I understand that bootloader actually handles it, but I really doubt
> that it is "controllable".

It may also depends on which CPU core is started first.  These SoCs have
both ARM and SH CPU cores, and the SH core can power down all ARM parts.

But hey, DT describes hardware ;-)

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
