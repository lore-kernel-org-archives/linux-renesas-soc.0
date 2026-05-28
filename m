Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AA13F44C2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 13:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975038; cv=none; b=b8gIVvyGMXimdxDpZ9KBhNkf1wSnsTh9TAdobhzURt/QQgnNcTjDdusaoETiMj/BT3uzJ7h47CW1qJKkkUWBXx9hp/S65Y9Z0DvTI1P2zJ4DcE69wHMaGryp9uglmH80gTVpHM2yV7QtpQFwIH38QXYmMcOYUYR8BmXQ04bt3qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975038; c=relaxed/simple;
	bh=jBGtRaUIssZJBiL6UhZEdhVI/X8GSvu/qG2UsvRupI8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBUyytF4nmzAemNykfIoDye+YipFDqkszQgHEp6DTAZNJPjMDl/9KdRVMYLcCGDDYK0XNrzZx6ZsfTf8mc2XuKn8jAFSN1vdMS0fds3cu1nMw5yeRs6g/Wfr8TkzcZBQs9BBZWCqheUqEvRSlhhnYCvEbVh9GbNAiSgFobAj/4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bdb3eb93e20so1253111066b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 06:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975035; x=1780579835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fm7D9F1teaCAYCkqxhP59SQwZeLN4ep/zHxw7l5Vin0=;
        b=RGi1WD8zYBqAMMbQQ1NKWO9poyeia2uoo/5spgQAxeqtalphUimU5ub0cSYzlP8MTs
         Ly/oDCUtB1/n8CA7eLa6QEa2oPSyhRJgtFYQDyG4LvigdmkQDH8mrAtkeyi6lFrsAGb6
         kjHyeti++N9Mr5/0Smyeokls4xDknDs22bgjFirLP7J8Z1slDSA/en+4w7aZz0nQgFlt
         fkrwGqG9avhnQ2uUcgzVKoETsBss0B2y104vIGj/zjV3+xkwODd3hg0ei2rHROxNbhwB
         bsIg3OqTgZDptPNwzuA8QKrWWKjrf7Ekc45w5KUsyvEsrEPhIqSq7IwKJLnkxfgEjiDj
         0X1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Sk/OmO888dCRUUjfYqyT1kdslTz3xfE9PixeCQzLUscMz42OWOhu0nCAznoAdZBWy+H8lNdsIOxhBkQfXNDfu5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmRgoW5uUi/ZphaOm/knke/m28SMJ7mg/JxjHm5glscVS06dWY
	ZLpaUxCcefAiaFsiEHkHG4lG8fqSv2ig1D39VDTOctw+Ya3a6EqzflIc7ggukXk2V/U=
X-Gm-Gg: Acq92OGPpvQwmpF5D1D+uQUFKekT2hcKr12kunj1wS6KVMbaeWwO/PtIdKV8sV8DNDB
	8DyfpnEnNVhN29SfeG3KW9asc0NIyI1r+VpzLqtm+8q/0tIwEGnk6AzsUt8/HKNgdGcP+btmZCU
	aiCbdlU/E8cyD7fPbjrIeIoemlRBBHAqiRgmF7bxL8BZ+rD88ofEZWtq1LZx+/hxYATJ4bQ2hD/
	f0TVil6XfzJ5vzNz36Vo9L5uNAa+dRiP/Mjjpexy7ISSjMcDUw9SHmAFOXi0p/dNqSpwKiarSMp
	rRV/bIZW09wVumMr2lJjej+pkZO/koSXWj6S/TQNRMFauNzPuppCchyuV5umZ7eyX7Czyw4N9w0
	/9OqM8svHsjKFwdVLOOdCEp88WR8I3wrCHcRzPz5M+wRXShBvBsLLhrcQMwIIQ8/72vFZcz+yzK
	AyrLKnTIbw+SdE++/WQHDxT87E/CyyhluGoWOHduKykAWqSdryGsIP2q06xWbh9SOhCbx1A5E=
X-Received: by 2002:a17:907:7750:b0:bc4:b9f5:fe27 with SMTP id a640c23a62f3a-bdd22a3f5abmr1211482066b.10.1779975035132;
        Thu, 28 May 2026 06:30:35 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc2d4defcsm730543266b.16.2026.05.28.06.30.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 06:30:33 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bdb3eb93e20so1253104766b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 06:30:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/V7sOcz/JlXNZeQkCYJ55Ks1la3/Vn9MflRO7KRTqxVlyyD3bB6MbriyFchDWpTzbLfbhFApwZxU5Tvjvbw84i3Q==@vger.kernel.org
X-Received: by 2002:a17:907:9d17:b0:be3:9977:e1c7 with SMTP id
 a640c23a62f3a-be39977e94bmr698117766b.19.1779975033006; Thu, 28 May 2026
 06:30:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519074702.3308-4-wsa+renesas@sang-engineering.com>
 <20260519074702.3308-6-wsa+renesas@sang-engineering.com> <CAMuHMdXpGLYrSMNgkqUGhhBJPuQKt-KZGGsXsbchAixbYRvD9w@mail.gmail.com>
 <ahanyVCJoqk9Hl8x@shikoro>
In-Reply-To: <ahanyVCJoqk9Hl8x@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 May 2026 15:30:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7ezkNDYfshKpLBSZygcurJPPWAf5bDF7p428S_S7QeA@mail.gmail.com>
X-Gm-Features: AVHnY4I-KuYi8iDJ9KVUVS6476LWmZXfOsoopgf9Rrtq-gY-1ednCl8_huhz8eo
Message-ID: <CAMuHMdX7ezkNDYfshKpLBSZygcurJPPWAf5bDF7p428S_S7QeA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: renesas: r8a78000-ironhide: enable to use SCMI
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 27 May 2026 at 10:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> we are missing you here! :)

Meh...

> > > +                       scmi_clk: protocol@14 {
> > > +                               reg = <0x14>;
> > > +                               #clock-cells = <1>;
> > > +                       };
> >
> > I am a bit reluctant to apply this patch: with all current firmware
> > versions, the system will lock up after "clk: Disabling unused clocks",
> > unless "clk_ignore_unused" is used, or unless out-of-tree SCMI
> > quirk handling patches are applied.
>
> Yeah, I understand. Maybe we leave out only the scmi_clk hunk and
> send it separately once it works upstream?

OK, I will drop that node for now.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
