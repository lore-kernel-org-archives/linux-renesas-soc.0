Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40AF3E411C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 13:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600955; cv=none; b=ZwxGgXDcE/cmh5hwk3cChvCz6yQwWzqzNzNRTYCLshhVn4AYcCB8SNtiqpePUfYBYODbz772iQi6e6pDC35rTBIcagbXmqwf73nl5IDvCzbRXG2FBNnriuaRmDUZcR7NvqsnWKQS+0UY/j/r/gn7fB3h/BXa4Uh8lQmo6XkFlZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600955; c=relaxed/simple;
	bh=xuYApr2qWZXqJ7pnlIxx/vPxMRV2f9KFjGcz6WImdvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vu/1uvSyXHka/Ye6mKqySRo3itInsqzpU9iEQuiaati3LGg+dKsD1Si5rjGYAl4xLcoyWLFT/ft5jdnGLDMlVHkB++O6P7QZAiwv2ySI5I6BbkM1PnWwsbL4mdvmrYx0aP5ssPqJ7yKRbtpXsbeeW7Uo67eshrkDPhfga6b588c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c6d6660191so1525503b6e.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 06:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790600952; x=1791205752;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BaSNmHda6KzqKPwX7Da3e/YKu7hL/7ztMKV1umyjMjo=;
        b=yaAsoD9jKiRFuiUixpOYyYrNA0LHzvdr/Am0K47KT67yRzpaLdMnfdaQ5pVWNKxsdr
         TQRuDpXtYndJfObc254VelbIms0J7agL2NtRlBUend+OwG9K0FaQKxIPAdq6aqMoVAjV
         rXYXeesdhjVHYvm+7QEkWa2+EdwWp/PW47W1XQMG6ilsQ1fb5jkRQHjZK5Krfr5yl+p/
         U6ZwT05XHwW0YGXlsRetNhszvh34ECYemP/Ndb+uIwU+gTQAtd13Opnb2ag6iOFBRtLc
         j/bUu1+dW0qIZgShzccc5V4h08naD3JJ1lYFZcsQlruUzx7bV0pkZ5tYurfiYhEByydT
         yxWg==
X-Forwarded-Encrypted: i=1; AKwUvBxKz/aDzbChtLvI+U2VqiEaI+lTvrKpT/ivKagZw9ejGlKyWkrzbujlQxqDptP/vuIBzZ5CdLQwcmOsoaeKjCtLwA==@vger.kernel.org
X-Gm-Message-State: AFuF++l3bWISgAp0rhgGeA+pVLryRDSBFIrmvUJqD4WAj5rNDcLp8HqM
	ePk7GUrdHwxLOx2dxx/jn/hSZp6lYzpXi4x1Ee4yxFMmTivWpiQdfFJ8QT3obMtt
X-Gm-Gg: AYBFou0xxT1grrqP8VdAENLEORx/crhDtK6ipGVU3sagbkFpabztg0wPS5FBOjYH/pp
	dQ8rQXlH6ETVUeeS0KdQ4RQJPUN7h+4ZriihEdCSzqHgJpFE2hoL16uCfLN0C2er0N3wdtz4GIg
	jp3jPWjO/A2nsTdzGa3Nx4q8dE4qiqM6n+DaWLlCuQ2JN3+UyQayCeinAQ0ocWRKyP4pfSm9D7W
	EOMBygC9F9gb+PPnh8TV8+OJ/nR7ZNnG4dP4k3+YPRWSkq1vu/kEAYPA22P6AADS4wankj3oROb
	eVSaj0gu4lkMeeq+5eqrZCgTNjOHWLSnqWpoc66DgKL9kND6ZpH5xs+jq+3nOIZK5sACdJJUrb6
	rImjHXDc/LGwb1Ph3iuCqvLgTWjOplFM/djPK3T24HUfwzpzcTpo1GfLB7myduMzW8mJQW/sWxk
	Y+j1boDawtqX2KhHOml5IssOh8hqb18EEDtNmxaMA+2dYPGzJz/z6N3ANihj/3LsKNYmEDIRcjL
	KOD7KWIZ2EXs5siWXkqoB3nMHfign8c/lhU
X-Received: by 2002:a05:6102:f98:b0:7b5:4700:3a6a with SMTP id ada2fe7eead31-7b547005e45mr655160137.26.1790600517538;
        Mon, 28 Sep 2026 06:01:57 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b9ae253sm9186761137.8.2026.09.28.06.01.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 06:01:54 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5ce08b5bd3dso287082e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Sep 2026 06:01:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzAXov34yT2eSD8MNEBwAzZCm5/yvnY56sC4kF8Xfj4p3Qjq1NZucT75juNyM+RilO/t1giy5PdfEmxKCUZ/sg2tA==@vger.kernel.org
X-Received: by 2002:a05:6122:1da7:b0:5c7:a9ee:dcfb with SMTP id
 71dfb90a1353d-5cb090282e5mr5364701e0c.5.1790600512952; Mon, 28 Sep 2026
 06:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903205153.283553-1-marek.vasut+renesas@mailbox.org> <20260903205153.283553-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260903205153.283553-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 15:01:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUdALBm4qBpobaSN-O99Sqzf373tyMVOix252E7Mqjt6Q@mail.gmail.com>
X-Gm-Features: AclHuK8yjcBPkmYx_9D-prY3k3lNAhlUTr3iLBx-i-uhHIvrir2OFt7Ni-g4t9c
Message-ID: <CAMuHMdUdALBm4qBpobaSN-O99Sqzf373tyMVOix252E7Mqjt6Q@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r8a779g0: Add PCIe
 Application/Local register reset
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Koichiro Den <den@valinux.co.jp>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 22:52, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Renesas R-Car V4H documentation R19UH0186EJ0140 Rev.1.40 , Aug. 7, 2026
> attachment R-CarV4H_UM_009_SRCRn_FSRCHKRAn_FSRCHKRBn_r1p40.xlsx rows 410
> and 411 describe PCIEC ch1/ch0 Application/Local register reset. Add the
> matching reset into both RC and EP DT nodes of both PCIe controllers.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
