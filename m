Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8046C3E1CE8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 14:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372912; cv=none; b=osamV4viEKtTlFFfTV5+VKePIqArgmnx11zdGcYisEMPuT8OkCYqlAMLviIm1Ec2h1zuTWbcN9anhVnCSsZhrp4xL2yFvJWUvwiCRrio+FySyl2Orkic973zQG1cmdGZ+2h8hLLpb/KwEcAD83QJxfIGrV3wbRQDa3tOcE5dS6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372912; c=relaxed/simple;
	bh=NlxQLUaP5Chjm4OrN1FpLC3mO3bI3kH8vyHo6dVucAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fUmI+2DevveL81793K80Fmj+0QnlaOTPwizqfqgIhlYorVRJjtF9TN3VODxNyynRduzCNGx+0ZW3J4qr1vZqGPXqfec6CTlApb+cPh+hHBWl/+1oG8wHAuDKLDAi5Kg7df3nrnH+ElpjJUm0iYcKTtKqX88YoCJPCrHTfkdlNU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso1308045e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372910; x=1786977710;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=giEldGY175WVS3peHWMV7A1WyTzZJJHYTsaFpkbRHpk=;
        b=YDd5X/ps3sSEDFiPN9yM7perk3jJSKrht+g5A3gXegsNn7EnRQAQwhOFpoa66L57e7
         eUdhs2nJ6Pj99wKXtsMa4tWjJ3MT74VuxjLD/w4sNyhVQ08xMy+BI8e9XwImbZcM1bkV
         Rx4uurVw0r9KNGmY5fH92WAM9wkbWt6vuT4czZiOiqGNTD9BRz3LGWG5SK1jNtPo5gVM
         cfI05GwlSi/+tW8ZbJjm1CLy7Bv9BGYMFurmsSJ5UG5Y/omNVWYXPQarxzkZkCq643Rg
         Rf6QYL2bWjHvbqvSM+uFJ53LXlidcKUPNNw6vtvaf9vg1+ci2VT+31kC90Zpm6P/umfx
         1WVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1KDg+vA23lH28aYU8TdVsR5hSmEWD8+QhSxAdi5IaVurCYx4NXgBcdAEoDqxpnxv1NN9HcsuZ32XPPsYOAQ9AWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcz0XuD/o/Rlpmvx9sCjRkvflXc7zimMOCPzgPRNd2PNkshcdx
	kZ96g6xADhAvKZReY+YFkvxAmC6OFXhu2Ebx4Fc3lynHtmei1hQbPRJEW28w/LIk
X-Gm-Gg: AR+sD13sunzRBzcVzAlEOl9hFOhJb2qoDUgmKgKIZhKDy93Tw+308ilg+WdmQlc+4v1
	SF9L5Ky//T8tt4aN+i1mHf5M467+OuP6bchXkq0IfN04lDgvx+I+YGc/x1Dkms8WszHWLR+hjpY
	+rxUFia+3DXBdtVfEWUuLII56ipnR36t0CtfDBXBhEe4xnxftdJYKYZDOVeSS3JxfcXd67WcK2M
	wQGPhRyXeE49zIlUNg59ezf20N4PmGeMr9dXMCtUUg6fSgxZl6lRMIJk/ye2a7OXnruB3ahq8hG
	zpgDqi/VtGbEpw2gDapcghd258t4DVjqC3AMty1PUzKVHXshirM3ts1Ag5U31aljTXnDzWi0NWV
	DOMvmJlAoxSYsExnGgYaYA2IVlLBkAup/2gooE4HpUKnESmxNSphMSyhm8/KCFpMThMBu35mZy3
	L7HaYeWD8oCuTcYuO0+wizLIXXoCI0dsKyG7HjV5MlTuHTa7Bg5FZOe+d/d0FieJpu4+S9LYK8r
	ep6q599SWvkO3Mgp83Kx18PYA==
X-Received: by 2002:a05:6122:44a:b0:5c4:1a0a:b52e with SMTP id 71dfb90a1353d-5c41a0ac416mr1318731e0c.9.1786372910328;
        Mon, 10 Aug 2026 07:41:50 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40ae6a5e4sm4420987e0c.2.2026.08.10.07.41.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:41:49 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-966d70b9e1cso1089855241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Aug 2026 07:41:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrHeyc3nPESLHWvYS1AeMYi1fdzA8VBEMVkjm37iXuUO+OstF2JNofjmUEBRbPKxZ0oCH0h9Ca6UmhukLral01NJw==@vger.kernel.org
X-Received: by 2002:a05:6102:6448:b0:737:783d:1912 with SMTP id
 ada2fe7eead31-764e7be8d9fmr5541460137.12.1786372909447; Mon, 10 Aug 2026
 07:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130539.11287-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130539.11287-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:41:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWP4O9O4hQ30mz8dL1iw_AgEPuqqZqRQiM=qNGqb2bQvg@mail.gmail.com>
X-Gm-Features: AUfX_mzwLbC_augmoVM0gc4_01wytzxMg7NdumAxkIRznv81wSo99Vl4iox5wsk
Message-ID: <CAMuHMdWP4O9O4hQ30mz8dL1iw_AgEPuqqZqRQiM=qNGqb2bQvg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: beacon: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:05, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9131RNX reference manual [1] DS00002841D page 131 FIGURE 6-2:
> POWER SEQUENCE TIMING INTERNAL REGULATORS does not indicate how long
> should the system wait after deassertion of the PHY reset and before
> starting communication with the PHY via MDIO. Opt for the same value
> as used for KSZ9031RNX, which is 300 us.
>
> The KSZ9131RNX reference manual [1] DS00002841D page 131 FIGURE 6-2:
> POWER SEQUENCE TIMING INTERNAL REGULATORS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9131RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
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
