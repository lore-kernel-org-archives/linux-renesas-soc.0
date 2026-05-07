Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EB23D3331
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148393; cv=none; b=ZU9soX4dU/h8XEPuLdX9/oDanvq5JvCCyC7UiYWWm042HIPJkHW0/jzlShWrq7qLbZtBIgg7U3HE/4ZUeYQUXCt8PkE0BixIve42rq0Di7dqcN2hvSlfI17rPJuXxt2/jr6qoZ91r4CETcIwj6UkpQUdrrZRqJK0H+36hczklr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148393; c=relaxed/simple;
	bh=tRHJ7X/o6SqI/AS1PTTqmm5hIDMZVmm9MIx3PzpYLJM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYUIJfsIrL0pEvcyy1MaBR7BEgDrAu1waKX9HaFgcRDSaR/yZhAKrdigQJnsuSYxGXfoTrMEYYtlbqVZViryegEHObcjSnDwXzn3TXP9smqM4idS54ctTcHAtoIjOF35FrarrnjbMqOWJqMFqL8OXafh+Pw6bJZuD4roCiCkZOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5751a9020faso430327e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 03:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148390; x=1778753190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbAo3p6Dhi2yXf2nsmuVyPALvyu+CLwPL1HCjL4o6pk=;
        b=isoisfPGIzBqruU9fOnZZU2aec9TFgmmwG8q7D9Ic9qjHzVl6WA+ObNjEdeR1/yClV
         QZIpLkWXdRC7yYlGwYeZDNpmLo1uYyJD5n3IfkeLcOF34RDGTEQ4djFHd1sxIdIGqDYr
         mwGZHi96cyucqA7nD9IwTIIVfuWsrwQEwLREjw7/4YNq+c6U0PLgW5stfTTj3SuEQ4wv
         GJKiyTE8eYdZmV9lpgdoWlfR+wzyXfRYwJod33uk3aZUZitgarGQeOc8zCgQ4EpmsTyw
         nT8s390ynah+lfpVUS6kJ6b+uH3YBjnEVFDjw3b5hVTC0mlnjj+GCf6GnWV777h76jQ6
         7maw==
X-Forwarded-Encrypted: i=1; AFNElJ+y2ymSkUEffaUn00PbX26UO1XcqOwgiJiHqfkjF48xnyInuMM1ISC3DoD4TQexpmo5FV1NxWNyS9pmPSZ0QxPlCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7eyKzXVSYhMsZqCF+eC3xY0UwIrVzD4G0+JCXBsdWXJqzcgkz
	bp24b2UFTdTTZNPLRXC2XoIfWzY6/m2p0nuKKaajXzHC9rsyDq9FIUb+PwC0Odtks+w=
X-Gm-Gg: AeBDievd3QnJCJDz+ZZwqh6BrRWGkNSEhCWRml10IcwtgrbEFvJw+tYquZaSHZlKdDP
	OiT/aRyNInbGN9edRYaTxj/Etp9Xz7GUrHRLm1CBexVwK9pDHtiU/e7ICA4aYSXuasyI9ECJnIN
	dcREGc/9jr2CQevYFzg1TAnWZC/1wH45xYb8qcnFN7nK6OJ4e5Hf3JOP9BZcxEpEY3MdD4B7nxO
	BYUuXHhk0UgmU9OuRv4y3fh6M8vtxMlMWF37hm7NxLsyL45wzTMJ+zWJDBQwghphlze/gMw4h96
	R9TzaU6B7sWk9L6EcXu+XucCfv0i9ajXN5CIN86HTfBH1ruO4Tx/AUSL8euaRwNGKR+JnBwSo1u
	7+iJZghhUjyupFgP4dHGJ0H25mW7HlYbpD+x/id6ooFFwGTw30gI+zfQyq88n4sPSIovHvY3nF+
	w50CG52FbXfPqxZUX98mqjKmQThMiekmQRwRvxroRayIu8mwgFYq5uzq24/b1HvrcOxflce4wAo
	U1neMStMA==
X-Received: by 2002:a05:6122:3d01:b0:56d:2ca7:fbc3 with SMTP id 71dfb90a1353d-57559509d20mr3730594e0c.5.1778148390207;
        Thu, 07 May 2026 03:06:30 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-57533806c17sm7316550e0c.0.2026.05.07.03.06.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 03:06:29 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-62f4c4e6694so423816137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 03:06:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+03c17AXVkOTV1GkAqRMMfx1ZsudAkYfvkQk166Mv6qSYFeDr+M0ShgEcLTki0dj5A6CUcDpOIaLslq3gyRdciAQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5e8e:b0:602:86a6:9877 with SMTP id
 ada2fe7eead31-630f901847emr3540642137.19.1778148389023; Thu, 07 May 2026
 03:06:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com> <20260430125342.439755-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430125342.439755-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 12:06:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWfexfzN3RF0Jjh0ULPM8NFe15iUBYnm60vF65VmZz5xg@mail.gmail.com>
X-Gm-Features: AVHnY4IlU4-oOnUm1IF5PaplZdA4xyTiRvuazsxMaCKwtMZt83hFXHJ6z1pCIhM
Message-ID: <CAMuHMdWfexfzN3RF0Jjh0ULPM8NFe15iUBYnm60vF65VmZz5xg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] arm64: dts: renesas: r9a08g046: Add pincontrol node
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2026 at 14:53, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add pincontrol node to RZ/G3L ("R9A08G046") SoC DTSI and set the icu as
> the interrupt-parent of the pin controller to route GPIO interrupts
> through the IA55 interrupt controller.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Added icu as interrupt-parent.
>  * Updated the commit description.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
