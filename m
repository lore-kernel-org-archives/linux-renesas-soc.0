Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9D234753A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 09:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208170; cv=none; b=Ar/r9fmaTd4CLIeQjEapg8RJw7/xxgeF9qY81NqnGW1BMLfVpFnDXw/WhnoxLTkuGZfQCH4R43OGF4ShJPbDU7q3lKjXu0Nm/Bv+SX4GLnCCUiXOBy6zqNNGj3de8YAoqHxs1B01V91JcFlHVnE9BZ4oAMMzC2EC1cCJtFvZMgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208170; c=relaxed/simple;
	bh=TiPYaBlLWXLRJ91ZuqxXRCPeuUJGlYF7Hrg3spsSi0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+cYScrqfYQG2vVR6mIISjcvoe7XeltpYbN3l8mmy5t6U4l2+7xXX0Dm6DnAyKtGC2lnKqtHCmetWeKOK1gmzgHz19gMextbKowcQ/Pj8N842yoZVBZT85YPoRzIHLtu+Njb4AwcxJNOpI4Dgc5P5UZo2sjm9uqkvrRWWNTaCgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9539d9f1675so1095114241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208168; x=1775812968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQiSqxl/EeQIWuDkdITPLu7Bz6OtmpPC7WYHMXTOSFc=;
        b=hvWLayfxBBkj+W0rlW+U0QccGE5Pfq1CEwHXN5G2MWcG/qAH4xkAocRtew7WWEkAed
         AIbszLpL+qqR52gJCswms39FIZcMjrxHqZqbMGJdC5gqMdiGtzueF391YXHjiOqNyirE
         pgcnLckYQatx8qvcvwRyMlJNu8cmvGAedbGeSkVrMrv5dMfYp004HsUWtA8Gi8yRBhvJ
         qbKndpHpTyUiKxgZqSarE676GrWPlhQ845d6eZ4GlvYoZLzwvc/86Tj4Q3bCdOAsJPgF
         5szT0QWHtOFSNGsd78GdWCKwvfjlpc4juH3OrVf96kr2H9KTYQjlWI+Gwz71HMCG3uIR
         BLHg==
X-Forwarded-Encrypted: i=1; AJvYcCWH6IXFatfRaq+lt+RtNVLOKgRe3fYqMPNFjaY8N+j0oAsbiTDG5vchhLtkhPAkj4hcKkYB3K9ZkK6jPUKm/S2NSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL9ugYLtijh0+cLjk3WFGYAjXI04WBu6b7jf3hFGMq0jU0umwD
	oUjw4XKib8KCXS/tQXhLH3g3NWsBlUlngw/wbH1yDMyHDCJLcIFrTJ31KcJW6/F8
X-Gm-Gg: AeBDies4lnc4/89rgi0HkIZUV8Oog60htwdP3JUS12PsG4S75U2zlAsmYAzI+VKkqCX
	4p2V/ecSjmjVN6oDwruA6lIAwu0xW4Qpm83QNeY+NX7QKNcp6JKlNuo/lQ5zKiQLqkO5KMR8s87
	VrSR3vbTzSlZ70I/lTYIt0tDLcNOhBBPOAmd2GkBzSj/1xqB+7ILZ6VFBggCRxaHQ52NT6u7DRd
	4x08eVJeMbBi2PKjLi+nt3frC++qUaBPmA0eZXGMU7grcoqGHHGZ3hYsf64Dv9Ub8dnutWGzL7/
	jjydiXPS/oRV1nY/Q+o7HF7PcBpd+iEFX6jhufPKb+xzKItnDE5pYICv5qxmMUfOp+dnGxUvzq0
	BWRkTL8ELCyVPDxqEWAcWGL7ADGCsBwdKc6aW8k4CEDeIeAV0SoWjKxUIVwfqPv0dNyehI9+UWC
	+diJ5c0r0q8q2L3bXa2r6bHVvd1go/jVTmBPEZsNE6goBjU7AdfB+N3aTVUsam
X-Received: by 2002:a05:6102:d87:b0:602:7881:5802 with SMTP id ada2fe7eead31-605a4e11f4fmr929500137.13.1775208167779;
        Fri, 03 Apr 2026 02:22:47 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fba6af44sm5754099241.8.2026.04.03.02.22.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:22:47 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-6057af134c5so1214848137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 02:22:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKLqlNI4FiWKZ00mhus1FzJlELUVC12ROLQMScq6nusRtMIoM8ZgtEftyl7Y7taXBPibD0Xtko6gv3BaEuhzpYXg==@vger.kernel.org
X-Received: by 2002:a05:6102:148f:b0:605:85f9:453c with SMTP id
 ada2fe7eead31-605a50d3dcbmr853511137.26.1775208167106; Fri, 03 Apr 2026
 02:22:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:22:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZx2Sks_PqfUO5QRt30Sj4DgMc3k2zAB3o=UWgA6P1CA@mail.gmail.com>
X-Gm-Features: AQROBzDTpVIfWHVjgDI7Tc-gqwb92042C9npzZ6abPqPFd-FM0Csq_Yypvn33OY
Message-ID: <CAMuHMdXZx2Sks_PqfUO5QRt30Sj4DgMc3k2zAB3o=UWgA6P1CA@mail.gmail.com>
Subject: Re: [PATCH 3/6] ARM: dts: renesas: r8a7792: Add missing unit to bus node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Mar 2026 at 00:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing unit to bus node to fix the following DTC warning:
> "
> arch/arm/boot/dts/renesas/r8a7792.dtsi:89.12-94.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
