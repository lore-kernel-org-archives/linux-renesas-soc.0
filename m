Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F6A3F6614
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371588; cv=none; b=CSraAG2NS0Z6iRSCqqzAexPvZubyHelH/YbkBOBS4vWfXs0bcHDXvjGhMRt1rFkPsCulCccIF/eYE3dFtkT4N0KxAQP37ahrd7uURYfgR1w4OB+sEpgPaw5IfRgQBGPEwEUSFowiJQKSQDwV1MXNv/Q1qka1p2bDz7NOcH+G+ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371588; c=relaxed/simple;
	bh=LFVUV7tv+VXxprYyb3YnUD/Y8MYj5qklAjHaW/X3Q1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bjSslw9w2/4su37F1cUkFDniNi2DwRecE8YQ71G4jAakLO9YYtKbSDYLTAd4pbXyEvxZYX7jmNFt6YcOZ6/Xg9nzWJ6EpX2zek3nFEtvRQGx3qQXW0gPexBuO1hXbCPAOLuRYcX8PUozH1IV8pHcPNp+lU70hkXdVqAJyNPmvTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-74ad03fa605so992277137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371581; x=1786976381;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+EdnkOjvq7HGz0vsFhTeBvomTLbOigrIz1VJsvzEruM=;
        b=AJQd80agaf5/vhCQCWdSOQm85wLGpfFT5O0yeQrL9pK3hQoCLk/VYuFTQKq5eMJjYw
         uotE1T3NW0QGKt8F/TNK3gJjhPb7Dyc18S1meZwrVSz4x7oJRkDAtM2KANjfVZU7ubhU
         DU7NvS3c5eUsPkoH1qi7SN1UAxLElBoYI3Q3VKwASDyfhbYbclDQCPxL93ZIZHyiq7sy
         A/WPRFQlh4AMw1DN4cmKNABTKs7MZ76uXDLmKE22gB/+yQYuIYV+K3b1bJhdbdYHtaaD
         C49YsGZrXe3loFHpwlfKvwJveEfDowLNVrEyhJRprz1nMwc1z4BfPzO/76P1vNsGG8r+
         klFg==
X-Forwarded-Encrypted: i=1; AHgh+RphwXcB8VWBU/tExWjK1ulNT+klRZ9TaAXosItw2szeHWYX5zJLD0E39MP0asQ/mi/nUSmDPadFBVok5+uXz4mBvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvviIxnSKEh7aS1mR0QWtCEDF2FXRHttRJPya4CxP16fpUW1QF
	zaUaX0BPQVlRdTwdoXdVLpSZy5st0IYoolfdrrXQdLD9WvM0zpssMqiahdBUOxwu
X-Gm-Gg: AR+sD10ROSPhysl02onorihtYWvtWhuX+fykWsmAt6MNG9wDCegCfbS+IwAX7LbKNr+
	OxfZF8dpfn7qOewmVvZCghU61lvBudbm6oPzvj0RqTu/8LlX9Cch6/Mk1FBxlY6R1/fcybZsaTo
	z6ezlNT/1PldoyAJDG294/K00XyygXz6HxsSsMV+LconePcr+0EbnPrsj4At6y+KlPDlI0K/J/k
	EWUNxukITBMB8IJIrwH+kUgiwvvsxRaYAWT38ztbUCLYO1+FrBNIwL+MxJ9duxr9KJJaMtyUEPv
	ZzuLFlezBzXWeuIaXNHF832QnKO+ZUv/Hus3ZhziXmnRDJgnMoQpDeqSoEnly3kXFAa285BoMBH
	LP/pzFmajwovZ4kO0ZbV4J2pBMNkEzyRKUn+k34nWaBJebPq4KavlyQPsUdKasb/CXVvZUsd8Lw
	27qkZlc0RJXCVnpD/h2wpzIyPi/u0JmILjxWqQgfywGZ8V9GDdGylQZQ3V6/6vhZL6eFeDFHXy1
	VObbxIdDqN/gdHdKx0JWg1Yug==
X-Received: by 2002:a05:6102:14a1:b0:763:ce80:337e with SMTP id ada2fe7eead31-768e5c16959mr596835137.1.1786371581256;
        Mon, 10 Aug 2026 07:19:41 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f30870efsm3334853241.13.2026.08.10.07.19.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:19:40 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-977258a75d9so1016976241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:19:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqZxZdywPNq856+VN/FpQcmLrZPUrwHYY/QjuUav+VbGn3qaeDsuO8lIZvAgdUD8trVGiy9Ac+qMR5ti8cXWmVeYA==@vger.kernel.org
X-Received: by 2002:a05:6102:4b19:b0:739:5cfb:50f4 with SMTP id
 ada2fe7eead31-768e7e0207amr545053137.11.1786371579827; Mon, 10 Aug 2026
 07:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130325.11080-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130325.11080-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:19:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUaCOFhLrJdzbRRE2PYe2jA=Yiq9KTCRT4i4Sjyj0gnvA@mail.gmail.com>
X-Gm-Features: AUfX_mwCClbcVmT6ktSeGN6Av5hVIsJrTjBIhbY7_MyHUutP51gtYjLaOZvaetQ
Message-ID: <CAMuHMdUaCOFhLrJdzbRRE2PYe2jA=Yiq9KTCRT4i4Sjyj0gnvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm: dts: renesas: gr-peach: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:03, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The LAN8710Ai reference manual [1] DS00002164C page 61 FIGURE 5-3:
> POWER-ON NRST & CONFIGURATION STRAP TIMING does not indicate how
> long should the system wait after deassertion of the PHY reset and
> before start of communication with the PHY via MDIO. Opt for 300 us
> which should cover every timing option, including the 16 us delay
> required for MDIO to switch to 25 MHz listed in Note: in Chapter
> 3.8.5 RESETS.
>
> The LAN8710Ai reference manual [1] DS00002164C page 61 TABLE 5-8:
> POWER-ON NRST & CONFIGURATION STRAP TIMING VALUES row tSR Stable
> supply voltages to reset high is at minimum 10 ms. Set DT property
> reset-assert-us to 25ms because the LAN8710Ai RM does not explicitly
> spell out how long the reset has to be asserted, but this at least
> covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/LAN8710A-LAN8710Ai-Data-Sheet-DS00002164.pdf
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
