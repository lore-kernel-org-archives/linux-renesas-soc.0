Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276253B3BE1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 14:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782139052; cv=none; b=PiSf7Y+iPkyNXhcb6jUMOppfMmDKxFviuFBHqDyVzzIAiKhD2ikRZL42qMobKKHXAKnONb+wmEsZhXQ6oAQSxP9ukDURbfF/kWGsw85dpu+ApcDkjGKZVoH17pyNLBt8o6gBmo8JlWgP4TJCz6vgCoxpArwuDIyyoZh/rjGgSvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782139052; c=relaxed/simple;
	bh=gHencO65cRvW6GG9TEM96PJDcvibKc1PL0bEr+ar9ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KiPp3m0XVMUBlMIkrxrmmmQtLSEl2YWc1ZOim0RtLy3PPiYVVQHQO6mV7do89jRCdw2pvtiBLoqDZXpcOYvN2y5gcsaGczwDLvX8ZQN5jJxOqj6YuaF2gUboZBTS31pwclSobHS5wfCeOvxJMX7Kn/Gr7EYiKBGyDXYPCEXF5gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-96710629eb1so1669535241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 07:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782139050; x=1782743850;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcsqXGndiQDiWLX9BqUSUdSKEoXLrcy27ADWxumaXQ4=;
        b=VSA9DGCadiwzsai7Cw/Vj5cDpbKBrKmhPQb7Jp91vEfru6O5ifdRIeTs0dXtvv1gKY
         4eODILh0ub1wyIdQp/HfJ850sBHTnYZF//OleIkRt6lxzjIl5HGjXTlMldpQO7XF/dP+
         gzRXZfzS3/qY4RKTBDftSDjw5pzw2YVoYAiu6+NHcp8mbeBGkWJ82NbrUJ81nUmn23HL
         esbahvkTqAuON7ySuZqnPle4PnnULD1mQ2cCAdDkRCdWh3weTLude1CKdu8G0nMcBEX3
         sUHpf/3vFW9f39dak6kkSt6mPumha8rxwBjZvrjVZ/8ohhohwT+z0jZzUtaMcKEujZEk
         eIug==
X-Forwarded-Encrypted: i=1; AFNElJ8IEzDl8r6MTiDua/RTOvlarmmSL3S6BtGxhv//GBTG6zHYInPn+CHb77P9yb6H72ZBz3SXL6SdP0p67l13ZhqIEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoHdUKRDF/UObbpzkMAW3yCCy5SzPP836PKUCMTxTP9T8JsWSw
	xCBw/98WAi6k5aG1S7Fa0ZUa1aED71IZ34b1nydoqZChNlri7IhIsppw5WJvOk7kqnM=
X-Gm-Gg: AfdE7clEvdQRB2zsN80xbvhWaKPjTwqpMpRmUsf9vt5sG+xgb7PdWOZmPAp0Tmmb07o
	NqwsnR7QCAcpHIh8ItMYvxIqG0bcdmkcSgk9T7P8HHKoMF/BYaJ0C6s4/thBa6pGbPZsDqbkQth
	vuwbXQrsA+lkLy20KKgvPfXAGu/nIDHOsUrx6MjuhAimRb0TEXEEL0uPQ9sql3sSQszFkfBg7I1
	QutqVpFc1u+s+byJpIKqlEoOdAFZwkBo8gW/cPq56CeK7Qdp8qtRB9oqZfO0a2qD9gh5FMzgyCj
	Hjvu8ANwUtgSpJ4uRBGIp0y4K93sm/UXRbEJ6gsAsnB42mtuociWHe2XsWw82WyhDnfdtB5nDZk
	NnfPojVtPO+66vuBFmcnjRTRP4hZqcqPumG2ocJZO5Vw2vdPi1krr1N7uYOEmHL3FB6zmBM+0Sp
	IrX6ztoSDnrPpvn0P3DkgsrZcyIEdYS654MQOfNGZvnR7c1cd6pQ==
X-Received: by 2002:a05:6102:91b:b0:6ef:db57:d472 with SMTP id ada2fe7eead31-72a045d4208mr8183492137.27.1782139050060;
        Mon, 22 Jun 2026 07:37:30 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9670bf154bcsm6668941241.0.2026.06.22.07.37.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 07:37:29 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-725cf9a923aso3010415137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 07:37:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+USJqGSIkXZ4DKnGWlP+ofyJu/JCdq6B0niVpYowc6NCr64VmxnrJgWnpb+Mi7UbzNw7o26FqtZoe9hlTcQCGc7g==@vger.kernel.org
X-Received: by 2002:a05:6102:4415:b0:726:cd42:d039 with SMTP id
 ada2fe7eead31-72a03fb3994mr8954632137.24.1782139049133; Mon, 22 Jun 2026
 07:37:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUEPR0xWXRwLjBt5sF7i4HxcDLHCQGmc=gGvFmHRDv-Jw@mail.gmail.com> <8cb1c3cb-3d8f-4e76-99e9-ad78ee149556@mailbox.org>
In-Reply-To: <8cb1c3cb-3d8f-4e76-99e9-ad78ee149556@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 16:37:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX2-=47ZKP4MsXsVecBoEeEF6=e86nOUAYoA=Vbvi+=Hw@mail.gmail.com>
X-Gm-Features: AVVi8CfRVVXR2FXSKJhSl3yxE2bVY1oBSZbcvDardGByw-FE0lPwGDdOQ4zidqU
Message-ID: <CAMuHMdX2-=47ZKP4MsXsVecBoEeEF6=e86nOUAYoA=Vbvi+=Hw@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: dts: renesas: r8a774a1: Add soc: label to soc node
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 22 Jun 2026 at 15:56, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 6/22/26 12:35 PM, Geert Uytterhoeven wrote:
> > On Sun, 21 Jun 2026 at 04:51, Marek Vasut
> > <marek.vasut+renesas@mailbox.org> wrote:
> >> Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
> >> which already has that soc: label. The soc: label is useful in U-Boot
> >> where it is used in U-Boot extras DT fragments.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > For the whole series:
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v7.3, squashed into a single
> > commit. Unfortunately there is no cover letter, so I will have to add
> > all nine Link-tags.
>
> Is that why cover letter helps you ?

Another reason is that my scripting turns cover letters into empty
commits in my local tree, serving as separators between patch series.

> If so, I will start generating ones ?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
