Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5E3341AD6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 16:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405054; cv=none; b=ZVs2gA/tX2V17i2RQmPGOHnO1HlqieTTZs9U/FFgqPFS1JGlJj8wMx/jcm/kRTvZsrjCiWOizCNivBLBhgPArz2i1g6VlaSHYsQAQVMRw0Mw1qPZIX+LSxhTvik5of2KJXvBDRU2hrMmVF2d6QbsCCB29BAomm0SJUvJezo9COM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405054; c=relaxed/simple;
	bh=ushmip9d2SFG6bnjsZ8yz5Zdtn5SOGcJMUGcTuHYRJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mIUHobRiXTgtdN1ar83GQa7ro/Pz6Q0C6NPJ6S+cRQfaYwcv63LmGsMAID8CtPtu4BMtRQaaSQ5wGRAsFv05a4My73dQ2+vPUKRA8N65NHxLcK2DS2UzkqXsDRUSRZGZY7Lh/KOFMrLZOUsu6uboYUf36MpjVuB9x2VT2Px3t5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id ada2fe7eead31-798396c2ec0so920686137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789405050; x=1790009850;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UifqEQ+KQQAg0kseH9X1CMJd1CDr8OUeTRsEVk1uHRo=;
        b=PVTacjys4Rti/4i//aBTas7JG+8oUlJLK05aH7eURYaRQFRbu7ZYqdOeM4/TJuVnXF
         b57tDtJZJn2GSdgayfAHQy+3q58pPRISnlxNzmIZaTVmc+Zycn5oNWSRY3ZrNKlIpm2r
         l3msZ+pvYmSfJVYk+CoNBANEem5hZwUCOOZTcIbvJxsYn0PzSk98T2hS4BjsbyzZEYXu
         w0h06CxHS1fe54LEsgurqMEOmQtMA6OcLSwwRAFTYD28Q1HrEGK8snAchFXanskS2cMA
         tZktjZaTZNm2+cVqkdYGg6vxDpYBE68Wwy7QZuyLqZRDtvZ1T/n1X2lA08qNFuPW6G0E
         ly7w==
X-Forwarded-Encrypted: i=1; AKwUvByZw/zzT2Flyi4i4wPD5gRDRcJn0AnDMva8qDa9RuBr7hdmBcl/C+htm2EqgcUNyK6He+o+ieZ1vNZB0ALU37XdkA==@vger.kernel.org
X-Gm-Message-State: AFuF++nvYSVD/EMfol+pXhEFmZxO4CAn8xm4FWJp9p+fJBBih7ViAmBS
	4LVGE+I72sjkzJSDFkw1ZrWNFp+PgHFqZvI8V4ckjEKPlVmqQsLS/e/cnyyJWod4
X-Gm-Gg: AYBFou2T9nMQbpscQ4xj13smllda+J2ChV/55wbUUhqnY2KZvX9fFMpzB/oSh2gKIYo
	UL9bLx+S4YXrGtDii5RebxxpYSNEuAwZyx3WSO6L8/SFSruKGf2dKfasgUxnkbdB696LhQj2eTq
	bjEhlDiEOaMo0cL/52BebkaNxIOZHsVa0lo4SLdtT2zDulVU5/Jw44dN7eHj8WKVdG3jBklhuHS
	iYoZ7NkWj1YmK3yV0l0pWoBQTVjlOvwTtg5pHKABFxd3/p7TBJTwvvxn5DK+2q1OZEhfakQSkMi
	qbZJ5n5wsVoFZnzvxmdN3OLONdx+2dSGwYviIPbVD37nciuGNKF7bNQYoU5RRPslPfZ/S6uVOCO
	qMeGsvBRq5f1ZLEvyq4v15CHFmXGUokrCPsipCtVAhugeU89Kep8JldAYavsnJZFpRdTcIV2U2E
	EB/iiws3zCfkXBD1h1kl1uqoG17qvwCP7kP39Wr6sCJhXVmvelfthX6qHNIoQFlWObyL4yj+0Mw
	qWDxAmHNQYRaemVUiagQiO/+BeYIJyaJv9FfvJ63ruu5wNo
X-Received: by 2002:a05:6102:d89:b0:79a:62cf:2a50 with SMTP id ada2fe7eead31-79b58495f25mr3815411137.7.1789405050559;
        Mon, 14 Sep 2026 09:57:30 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982b9c136c2sm12226453241.2.2026.09.14.09.57.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:57:29 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7bab8eso1080782241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2026 09:57:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy78H1zb+B+yQakb8bXW3ZpMvKWeIF6TwB/Tqni235bHgnKqZOGsqs5oVTw9oMq4Ut6v1LRA9nZvMDnK/Zqy0r7Lg==@vger.kernel.org
X-Received: by 2002:a05:6102:148f:b0:79b:a93c:14a with SMTP id
 ada2fe7eead31-79ba93c04b6mr4018053137.8.1789405049110; Mon, 14 Sep 2026
 09:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-rzn1-miic-fix-array-v4-0-069112feec86@reliablecontrols.com>
 <20260914-rzn1-miic-fix-array-v4-1-069112feec86@reliablecontrols.com>
In-Reply-To: <20260914-rzn1-miic-fix-array-v4-1-069112feec86@reliablecontrols.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 18:57:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVg02LSTMweWn4MN4qa5w8CyuVjynyGYH+HUxExSw6GSw@mail.gmail.com>
X-Gm-Features: AcwNN1UCiZdEM7pRQ2nOAAFuR2AD8XncIqdUbLRRpmHPk43RN4HtjN0VXTDTOVg
Message-ID: <CAMuHMdVg02LSTMweWn4MN4qa5w8CyuVjynyGYH+HUxExSw6GSw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] net: pcs: rzn1-miic: Fix config array initialization
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 18:41, Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> Fix memset parameters to initialize the entire DT value array
>
> Fixes: f39e968dc168a7bd ("net: pcs: rzn1-miic: Move configuration data to SoC-specific struct")
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
is still valid.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
