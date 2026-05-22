Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C743928488F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456027; cv=none; b=tTOuamWbl/H1zuku6xjrMz/wxhcQ2oYPMI2e6SKxCFzWUTJRCXeEaK6vrZLrgu7NZXl/T4fNhpIVwxIJ9CDGi7q1UZ28XKryXdwwnvkpQOXoxu97HYg+Re+OjVZcd2/q7k6W6nojGnGa/LNHXgWk9v0SUOkzpjzR5jibw4b6mBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456027; c=relaxed/simple;
	bh=P3LYmZ7DJ6jiTlG0wZUwYnVm6oDbKtlScDzsiVFvWrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MB7OirRLS7uLMAUGvwEadDTkla34g4C+DB5pjQTZitUyC/zEa9qY818ipHYhps5Iqo2uL/VD0PoCeUyf8kIEABCMEwGb03Lj7AzTAlqgnd549YAk5qUqn4rkq5/+edhR6idVQ9/d7GoZ3YC7V/75XLJ1GhRJ9JFHCCm4iPicxCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67179ed133dso8572012a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456024; x=1780060824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rof2e6OjGUUG+ZoOg7L3bn2avl1gX+MuD7fzpYfe/9c=;
        b=AZ97XTv/OeXBlUshm381qiq/MnU79Tsr8IIDMY78SoOCcB+0fz8/TPprj60PXAWwyg
         pASa4yKov0ozpV6XhnvPG0oaXXw5+RWKy7yZ2gIJDnv4vZxvBtfCJzczh+STk89PE7QR
         PLfF09bmoN//aaJEPawGSXmfGmTxBrnjFRGCJW7uEqElqh82EwVefv0Z7mmmr+W5G9TD
         vhFMhxt5Y9W/DClFonXCwfO7XbVe+PcXwfo7mMeMO55k1S//ncnCXLmTuk6hd1xytVSw
         fy+yuRs5kaq81LlS04CZDXwnXf0aTwdYDSavuexGCJRzydrDfdsNvlCMCIpolGwZmRqe
         FYhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+X4JhvWR95fVgOe5MX5cWKHwmye+/Pg0DoCpbcBhzb+ffNb+jKV5yXa6F9RJSiRf5MHD04OD8pF2jj4qwgK1+Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlpsR23nfXMTmj61fbaGCNJtQ3Q6Gm/X+SeOsDrRR0PehVJzg2
	Wv8ZsmRXE3i8kF+iojOUTGwKRbxa4NgSM3MH4BGGAfZORZDgF/QHtun3lONBIDTanQU=
X-Gm-Gg: Acq92OFjia5SM1JhBgC7zjPw35VcUPR1k5j7T37P709gob1LR9VHOSsGpZSXK49nHo+
	FgMrhfefZebm6sIkEIz/YJ4/EHlnL+7pgXIXQFelbL6VtVoQZ2Tj7PwlK0SZmvVznW0NIBaFvka
	iwk0UEUYBO2aOe2bhpoSspU78qPRSK/j2b/eFaLehzk38aSp78cwFCXPlCNwh5mm3z+nT01DlFi
	+BDwiQ6kT5f8XqsRW1pJ49qmTHUPj0hBmoGXd38X1ztwT4qK0NTjPNNmf/3OrQA5tcN0xzYZ8S6
	302wkBiYUstTpkaKmRSPWiAii+JUC2Pm+0gY5nG6AHD4upY6qwU6WOdjZPtce2I6xTC0AsigFWa
	GGtHFhbg87PnyuD+QYOV7D1oZYUbkvAxgan2s+pEqv7K7VZYd1WpSymtKWAg0C7A2FylHdRnInh
	w46AQPWC6HEkrAUiR6qQOtGQGomXebkl+x7x4kD87EIztdBALSCQWsGAJWPtBUa32r746Hq6s=
X-Received: by 2002:a17:906:4587:b0:bdb:41b8:e0ca with SMTP id a640c23a62f3a-bdd28b6f5eemr183791066b.15.1779456024112;
        Fri, 22 May 2026 06:20:24 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5ece286sm53673166b.40.2026.05.22.06.20.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:20:22 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso12117405a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:20:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9n3lp/0zKPDCNdDrhxj4dnyqtzDeL0xP/Ve8TRAUxOhV13GbYdHRCeYbifOIr5IMLy0ZblHkw2BDBS9QJS2yg6ng==@vger.kernel.org
X-Received: by 2002:a05:6402:538b:b0:688:34c4:e8cc with SMTP id
 4fb4d7f45d1cf-6889c43eb03mr1886593a12.6.1779456022655; Fri, 22 May 2026
 06:20:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:20:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbJ-SPK5wmA68bg-iF6mhaHx8gzxRK_co7E2w+BfaUNg@mail.gmail.com>
X-Gm-Features: AVHnY4KgBi27n3nuGQlpIbkeEOVvo7gucNBwkT372ZXFKVfmiLEIJgWEfOyb6mI
Message-ID: <CAMuHMdVbJ-SPK5wmA68bg-iF6mhaHx8gzxRK_co7E2w+BfaUNg@mail.gmail.com>
Subject: Re: [PATCH 01/11] arm64: dts: renesas: salvator-common: Specify
 ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

No regression on my Salvator-X(S) collective, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
