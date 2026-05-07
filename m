Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ABA3C3BED
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778146485; cv=none; b=NpZNgG5Q7ITq+aPQkH3CCmcLheIuxgJZssqYn3OCAQZnPUfRpvniG5XF8XOwySAo0YCJQCFsCOxUy32QEPJgWMrsA7FKAHjePAtvu7x9zP/xsav1F9kzZCx0KNExko+4mnj2Aog5gWS1L9VNHZbJeZtxT4o1g5z1cnzwewzXDDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778146485; c=relaxed/simple;
	bh=EXL7itBy7SwyvckKg0HkmhYL9VAg/83tgztOvMxg/2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkY9ZASOuP+tVwRpaKPnnnYUaLweaTA6mBB+t+ipXpDT6gcrD5HrjDSwArK6eDZpIiuwW34H4yxrdcZmLicLZSt8hRTUyrQuq1LkquoIQ27R3GIeeRfkv6pA8/QfYjuKEZzywpj07bMvHA85VYzVT3MAMrWwbKwo02r3GF/28jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-6121f20650dso229612137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 02:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146483; x=1778751283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pg18/DzPAz6n2EUKFraCzWPc1dvLgfrdplVOvzpq5g0=;
        b=ZlcjfE7VU8TY815kIKkX4NcQVWTU+jT4lZt4TZyxZ8mUaIdwLhR9d06rGHBBjKaDyc
         iUMYtuNXqIO2h960ytw6a0ontfQhUXZotRFTbySXTHoTYBl6RWaKmBz4qtSGJt1hCuka
         B2DKkaoxkPBOEPAcCU/jeXqPZC71A0/XmCaNmNVf/UmwtSeCvaE4lRRh9GcORPQMNLQw
         7K0lu5v5u+i0X6xDLW5hlNzvQgigxqKsyxZqE2UNOhQiMRcs/WodBdmfCAFHMNhx0B8L
         PTPGi9N5bpeGiNCGjYgi+q8kQt13/BKXlWbHnq0GrI7G9Vixp9c8LaoOMp6u3PkVKc8p
         COww==
X-Forwarded-Encrypted: i=1; AFNElJ/TytG3EcsPM232mPBmIZnbBpMFuCxGTWTB+Paf9WA0sgFbgGx+1p2MjYTC5kih2dFSUxtLJZ8H4N5KUZya12MbRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqxU4ZNFqRT7OKwkKJ31X6Wmz7R6K7iWjI061pqQ1H/G0g6KV9
	MfI1VYWRuZm/ssUE1NiDXqp3U1wZka0oQVyFnU7Z2HiYc1GjnjAuuTeG5iCswTmpn5k=
X-Gm-Gg: AeBDietLswsySQ5BxDnp025rEIfzTFRaK02h6yDXS9VPVgUl5jFvIxreROlHI/va1Lr
	1CxS/sLTq1e8n+GQdfRWJ9GZbJezSx0iiiAsMJHBo4OZ2BF4smeUP9/zzlD5MKfIKdmv0DK2dUB
	KJLCXjpGHjYNrYnDQJ1TAYx7rlP4dw37O2ibz2P0L+rCzwZ3SJ9p2GaZQktZunrBG3o2qxDLzLG
	sZNRjoBtIceoTotxKTtuH+J6tX2yo1KCxxPcffopEd5JVzsQy0Q/dpbqBi9MaPBCH3dr/hK1VEF
	6oMzyfSJsFh9P1Fim7UjuLYOY3aiUWDghwS4/9xsV6o5npfBoaDPzlrKHMYkloCyPlEBmc7SD8G
	V3gO0MPTK2DcWlMpi1BfcwCint4tLHE6Ljymj6Mz3lwddPP0JK8V6b7CSHL39cwA+130K/QJcBa
	pLmTvN2f8z8SSsS7a8G6hsLoE5WUdwo1thwzqg00aPzphdv7V/gIaF51wB8Q5pTj1FqQOdYBL2d
	Y8DxY0I9w==
X-Received: by 2002:a05:6102:ccb:b0:5f5:7723:28ee with SMTP id ada2fe7eead31-630f8ee843fmr3273603137.11.1778146483271;
        Thu, 07 May 2026 02:34:43 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62f49c49cdbsm6013618137.12.2026.05.07.02.34.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:34:42 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94de664b541so189360241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 02:34:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/STVidox4dvWlAKZ9+7UqlTH71A3Y706Smst9jot2hUFTgNHizfjQ7Kt0zWdq83GJcAo2h83oBxtObtj5XwSj+jQ==@vger.kernel.org
X-Received: by 2002:a05:6102:509f:b0:606:49d:183f with SMTP id
 ada2fe7eead31-630f9060df1mr2849018137.26.1778146482430; Thu, 07 May 2026
 02:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504225515.114986-1-marek.vasut+renesas@mailbox.org> <20260504225515.114986-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225515.114986-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:34:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxjMbbnU0DE5VZ_trgpOmykZtMogX=ENoU+fnP9r6j=g@mail.gmail.com>
X-Gm-Features: AVHnY4JrmA0rqCd6_oyesdTMolRy2oBM0JSfiD2aIIZPeGwPtc5XxCSK-5XF7ko
Message-ID: <CAMuHMdXxjMbbnU0DE5VZ_trgpOmykZtMogX=ENoU+fnP9r6j=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: salvator-common: Sort sound node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 00:55, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Sort /sound {} node in the correct order alphabetically.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
