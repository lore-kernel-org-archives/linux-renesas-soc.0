Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE863CEB98
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 10:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519590; cv=none; b=i80q9wmX+8oOE+x7BP2I72n1XUoFliF7KerNwUU5ScFA2JqeL/lFk+4QyBjxcvSwmXw6DmqnSYZJEJIilw1FopdjACa0GIwCt3hegm/9LfxWCe/1tf+6/uNFM60MxeGOu2SqNstPF6PTMAn6i7ZHlD3D4++Py6DY6WmH1ac0/UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519590; c=relaxed/simple;
	bh=Dnk/Ep000DxDlm30ft/36GISAeJC6MWSp0hczCHVrsI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YSEsJDGH2KnRrM6+RblgIQS6NEj5nTMqQ/cUJJG8fsqqYgzKndt09KfXGORWw3QLaYBmmhlQAHR3JJoKP6lQucafV9e76v6/9FBv+dVb/hhGGe5c3ATPx7jrpcZ0RvmeY9wsXozaWAJVzz9zG+IeDuVFhpr7oflRTr+F89e8Q6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56b890d1687so748988e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 03:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519587; x=1775124387;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTtqqo6x9S580GU00V14/uSms4ERMBvfiBHq57QUXIo=;
        b=kIsrmJOo7Ej3nC4IGToMJu72oqiborjErHNlSn/YI2DXEWcH4LtXQfeydb9AtT9Jmb
         2CwO8F+qeud7/gN3P96pcDPHfDWZ2aeBXOcXPm8RCIvjj/0CtRWDcVhGSVA3FciD4r2S
         C/EH1wOMhnhJUcNulkB0oupJHGtr+OJMglPuTQH5TQARv/rHQyz7XpB5jt6b3ubH2YyA
         Fv8viJqwd48sCAZwdIyYNhTM/hVG2AKMW2yAiHXtt9rKafMtm1l2uRMIrh7LPorVLXMt
         gjzpEACIp0kylFO01NmbDjDXocLgMIkeEWUjsbpvTdyhOTtTkjkv0y/Ffnh2yKozJzZr
         MRBA==
X-Forwarded-Encrypted: i=1; AJvYcCVv9A0Wu4EkZHCOqYbxhvwnOEJeMzygnexPuHMnkTcCkgqV4OTMeu7RkKj47wGeSZSAoUI1rIzEM7ftbyL2O1mmww==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz0bWUJmItsuoXc5ljiGnc7DD537bD9LJcTQYYre9BnKGBx+3G
	GdXIjbBPiJsxQYs0pURehLgH+333v+oN4HCamjmCo6oB9e0DmUCC0JGaE0fOwGc38Vc=
X-Gm-Gg: ATEYQzxsQYWdGbZ/V87JcE8pb4gNPCRTEGsnHJnDgFcxmALC58Z+vvshWXgq2MwYy1n
	CryMg+rRc8VbRihEbdwGwJYrvg3YUXA+lWwDMy4EInD9xfqUrUyaJdu6diuyYQ9fggiPdzS4BaQ
	1KxsMGVCGStWpu+YwM8Idi7UKvMOlt2Eqtd4wzqZRg60x5be/7PCfFZydRO4dY3u7ydl/ReFcSi
	zjy6o9K8CYWXGbt4CB4k+cDHRtM0iZkg0qP0SgSJDypRJInFi3trUw6n33VPZNuR8SgGiWg9r0Y
	pql0Up+oI/ezOOKAPH42FDRYeMWnJQ81oBM/sZzzcKGfafd15QXKYgI8481hHWwBtDb+wqJHrcc
	Rze753wfNcX9tACUy9inQDNV8xmIyrkCxNIVFNRXaJ4hp6H3ENmxzmbbWqPF0DwUEV2Mgslpok0
	J1DItGtXi+fBmVYbVeHnf9X+Keeq5f4vfJS0zJvo7t+jp2j6+sK/k02o1GvMEf
X-Received: by 2002:a05:6122:d96:b0:56b:579c:82e with SMTP id 71dfb90a1353d-56d21f6772dmr3597308e0c.5.1774519587128;
        Thu, 26 Mar 2026 03:06:27 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d71947sm3459106e0c.14.2026.03.26.03.06.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:06:26 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-950baad7b69so422460241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 03:06:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJn8phujY1AmaWsgRY/+V8ldzOcKc34VgzScCw0ML4UhnvOSR7eARKwM8FIHSSH6FZcWp0NAPsaMPdHOD8wEdbjw==@vger.kernel.org
X-Received: by 2002:a05:6102:ccb:b0:5f7:307e:80d9 with SMTP id
 ada2fe7eead31-60394931699mr3392374137.28.1774519586614; Thu, 26 Mar 2026
 03:06:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302165441.4457-1-ovidiu.panait.rb@renesas.com> <20260302165441.4457-8-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260302165441.4457-8-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 11:06:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXu13hd95vQGKnwhJvamYEU30stfqpEup-UES0T1WJwwg@mail.gmail.com>
X-Gm-Features: AQROBzCyFc0L7MNPsR8v6JpI5CURIKpqB0sB1nizHY9j3c8L_BX7fUgN2HFl9ps
Message-ID: <CAMuHMdXu13hd95vQGKnwhJvamYEU30stfqpEup-UES0T1WJwwg@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 versa3 clock generator node
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Mar 2026 at 17:55, Ovidiu Panait <ovidiu.panait.rb@renesas.com> wrote:
> Add versa3 clock generator node. It provides clocks for the RTC, PCIe
> and audio devices.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---
> v4 changes: None.
>
> v3 changes:
> - Added comments to document rtxin_clk and qextal_clk routing.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
