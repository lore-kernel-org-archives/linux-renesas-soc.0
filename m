Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129EF4503B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 16:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456714; cv=none; b=S2MWfI1xdH8r4u2EfjCsHsHjqjvTNW/Kr/wU3KXr0EcFRnUeqUQmB4VRTdS8Mk4yU337P869Q5d2vOzInXctlBQR6sJWy+FRj3J44Tu8mx7pdcqMDiOJpw46XCmWzXd9sR21scE2Y/BPxjIYKvn5j3LzTqLUk0/+rHFCTOKWolw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456714; c=relaxed/simple;
	bh=y7ZVsokYwrOCxsUDPu81piViO80ENG+JI7klgqrWxGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B43LLYrh3ZHIZQooa8GptahJcDEgAVAEPu5p0X8YQfH48V5ywkAAQbLUZyPIWvmvEML1Eu6A1mDMjEndWqY8Z8sAyMtAVcV+qN0shwzxKkqB4d3yE3PbAfyG0FhRISDW4q2bXWG/BdSr27fO7zJRSppJkQUCFjR4aOg/S1PHU5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5675d609621so100106e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 09:38:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774456710; x=1775061510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PFcu8ieGkR264Mz98C/g1GKpVrWkvJMfG29A108tGUA=;
        b=e/oDY7T8ioH5VLLWJ5nai9xrMdwNGMoV1rNwcU9UnQ0t7J3cTmppqxlszV93KrKPMy
         3y6hmHUkBUaFu27xzuApemGt23yLfHjv92PYIhjLO05YRZLlgZJNjQPBB1c9ttLFoz+a
         ANNz8ofW1LBBXu3lGnP+zApUnidgWNzGZMhBUi4QFR47ixtzzyZFViIn5fjAUPcqioCc
         Ek3pa3ntW08htIPBXBUVJEWvZAd76cSoywSWno8i0CagpeHIVkbH4auCuyOouTvDIT81
         By6SxC3RkcJFh4LXL2L8QLLApmeNqvlDRlTo2vNGGjNXZZznWo5ys32s/ZiZOlH6TqoK
         ySIA==
X-Gm-Message-State: AOJu0YxZXj3kO1UKOtNPF4yGUqjDUGEUzQ2raSn8nhuJSwqRKYKE7TrC
	WINIJfSvihiqfdiEApltBzejQ8u3hdEZIFPpAZLDMu4kZxxe5XQksp+On9mbZqfExjU=
X-Gm-Gg: ATEYQzz/UA2rWXMlTvC52eve4ESbVsIfOkwF63xvoYKhSTKMpYXwjPMBtGPaPFRbiEB
	rzSfJUpCYKbhheblOWudyD3K/xE5ItP/+XlYjK/Lnu051Fd7qPHzN+JVBeQ/y5GCaT1eX3eFz1U
	FkIOOY3DariU34j2LtmeH+EealhazWNPaAi3bg29F7HqYpaS90ntTgHTj8psjubRLUwp1WTv7hn
	xu5ir8Lg8IIyJ/THiZf27nEQ1IKDih+lHVwucOqx+qOZ/J/8FsgTkRpWl5gqzHwiKPmwXVwh4R+
	+PGJM7bpbJmXGefnZdw/yPWrfa7DWNOh3+NxzZLqrWDs39sM90XxP3aShHOLfk6/DLUJk8/ySqT
	QR5AjBwVzdUuFQSA+/Oyk8cBqV7rvLUcFE2fAGTUOWLFHLvPCfI/Hn2kkO60jK0tR7IdtmudDmf
	17wZVrmJIcCQ7W69nwXFqBQRpIF9J7JgS0appvfgah+0CHFMgP/491Bh5lSPa3
X-Received: by 2002:a05:6122:1da4:b0:56b:5978:22f5 with SMTP id 71dfb90a1353d-56d220a8b85mr2634250e0c.12.1774456710412;
        Wed, 25 Mar 2026 09:38:30 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d394fcsm372496e0c.12.2026.03.25.09.38.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 09:38:29 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94dd7178d63so4545241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 09:38:29 -0700 (PDT)
X-Received: by 2002:a05:6102:2912:b0:5ff:dabc:db3c with SMTP id
 ada2fe7eead31-60387434993mr2416423137.33.1774456709423; Wed, 25 Mar 2026
 09:38:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325162735.24467-1-aford173@gmail.com>
In-Reply-To: <20260325162735.24467-1-aford173@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 17:38:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVnGv_vu7ZXWosGYP7-=c5wg71y0rHONUTrZCiJy5+shg@mail.gmail.com>
X-Gm-Features: AQROBzAhdR6SWkA32yBTrlPDW0lwKRWOJknvBYfCLd5RT-Mwz1g2JnCkKIPxPxw
Message-ID: <CAMuHMdVnGv_vu7ZXWosGYP7-=c5wg71y0rHONUTrZCiJy5+shg@mail.gmail.com>
Subject: Re: [PATCH V2] arm64: dts: beacon-renesom-baseboard: Remove LVDS Panel
To: Adam Ford <aford173@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, marek.vasut@mailbox.org, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Mar 2026 at 17:27, Adam Ford <aford173@gmail.com> wrote:
> The LVDS Panel was never shipped from Beacon, and there are device
> tree errors, so rather than trying to fix them, remove it instead.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:  Add LVDS backlight, some power, pwm and pwm pins all associated with
> the LVDS panel.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
