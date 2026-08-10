Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08142C2360
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368763; cv=none; b=e8+3ig2tFKulFMx6fUa+2Vn2ho7osqfw0z49xFxyBJ0fK/1EOI1ecIgT/btrquGFfFyyDLgXHMMHJI5M7JzDIYhFQfGOhMWH3NBwotJpKumHC3EnCertmpk9oIUyyGgp52Ob+2WAIT+mqoSsy8arbOitLWfgJsSDh2m+VXxOcrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368763; c=relaxed/simple;
	bh=VBVrTk/FhG0U3rekKIzDHHMpsUGC4A0uAO/Haxfyqek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIt/IWGIT4i5ALhEAJ4e/8eut0ZjEQQSwBVJx1blWgJ5GxPPOn2rUNdm/KRsaU6VcdKyPPbXNuRUK7EQLGXCvn0LI2Sm0BQ/Q+zLCXGD7YegAdjzDMkdCw06jWpIdI9B2XBn7+S3uVqYrTB0Ym6OH+hWQBlYj4/yof4RqIeneao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c3163a88a1so542687e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 06:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786368760; x=1786973560;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2rc8RvA9kkjGCpn5E8aKcYHZST75DhMDJbt7WVlzBWk=;
        b=QFToXACoCDn1ZokXG5I4yXp3+xorveaHJ14Qw0Ghly7knvLzUdGbzzrIK/KjT3GzNh
         e2uLY1Mgt8KIW099SEvKTo6FRygAD53WzcCO2NfgGHQB+TPlrLP/5Dbfcp/RYgJq9p5a
         jxusLk3BkBlZwIiwJrIOWLZtvvhzq39iGyqi4tU9ikH52RhVrSHRQk5fvUoUGVIC9rRw
         rNxsT60XQqZWhT8blo+hoJlYwH8poS8qqh72uYtHGHEits84Tn9bPgGoLuGpW6XSVwie
         /dU6GLLr7dE6kSK43QtZvgmeE5gr1NYZqjAe0P1yuniWvEBw5p8kO/2itj16qGweM4YB
         gs7w==
X-Forwarded-Encrypted: i=1; AHgh+Rommuo2k01b01kt9b1xBGILesVBjQrndDRcoUcjto2qGBaae1EE3enwsId5HCgN6b8T6gLss0LGD32g4IL+IfISwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYlH9yTzHj7JO8lJ3kAzBls8I5/NlrKh546a7UyZFxLD4iATZH
	iRJqjEpdydSIBRX8aQ8O64jeX2TNEwUvCqN1S2ZC8H+Kn4rdtUUnx+uXTW2uWxsS
X-Gm-Gg: AR+sD13BoyKZphvDRTcetDXPfviYejVkBosdqEtzDaHT2LEsf73IYPz8553/NRzQaGx
	YainDjCZSspaJ42t5oseiaVsmTRO4le4xIqDb1FVO/pLTefh9pShlOpvyvpzrVN4hVpawQe+r5t
	nr2wLJ+zgOU8vdgnNDupB16iXGp7ueXZbwp+v5YwaoAooOoDx+WWetByIs+iuQ+aaWcpJLgIYPV
	2e5CTnmoKHJuOImyRQMlhdYWOUZyxchdeqyKMl8U2MZbPWhKXRqU41XmbDa7UKH/Jaoe/8H9Doy
	wqnYIHLY9Q1N+B/Jpdcp6QmrshaQ8CIPKWi/NwH2dOTE8z0e3LD70hQ1pUEJAyXE+ovItVaNCiy
	zjpbQoEBM61/eaiyqSiD94lFbkUJknUYkDlJMfhSn7hbkEZqGgPYvIVQyvkAly+NnRSRqAHB0Gv
	iqw0FbYS346UD161QqNS7MF9kTPMwBc9z/9c4FUo24+3IFQACgPPvFp7fk9wHMr5vovxrZzD+Nd
	pvXuZNMRyjFCCiigXs2MBTwBg==
X-Received: by 2002:a05:6122:e253:b0:5c3:8568:d540 with SMTP id 71dfb90a1353d-5c4116a4417mr1934028e0c.13.1786368760373;
        Mon, 10 Aug 2026 06:32:40 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40ae6a78esm4243317e0c.4.2026.08.10.06.32.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:32:39 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-74ace427b29so266352137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 06:32:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpwNoxXFWiXV6RxeV7G8NKK/yRq7IaXpRo+kxRCImZQv9dJXEnePmMzdUW+K7CnHouX3kr76ZQcKQA+ax64Ih8KAA==@vger.kernel.org
X-Received: by 2002:a05:6102:2920:b0:631:4cd8:b6aa with SMTP id
 ada2fe7eead31-764e6fb2222mr4167396137.13.1786368757927; Mon, 10 Aug 2026
 06:32:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260801210321.383773-3-krzysztof.kozlowski@oss.qualcomm.com> <20260801210321.383773-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260801210321.383773-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:32:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWSGjT3oR=78_2UvCVzPGYevonOyW7FGFoCntQ-kksQYQ@mail.gmail.com>
X-Gm-Features: AUfX_mwWI2PNvnTWvynZ86pP9BaKomNHm-elSNyKK_QG8sLkG5jqEe3T6iB_ZLQ
Message-ID: <CAMuHMdWSGjT3oR=78_2UvCVzPGYevonOyW7FGFoCntQ-kksQYQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Aug 2026 at 23:03, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
