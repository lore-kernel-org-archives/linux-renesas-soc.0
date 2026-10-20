Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485396;
	b=uees2brd7tYb9s7UM9Z1eHeufZNHZzDN9hPpEF4lb29zJh+OY994hi0XdBxYJ3rIfh/6
	 r1xQTbr9z7OQn688eOMrVSb9kOFGSrlFbeTQ/dPrgQh/q0hPfbYiVYxPiqsSMN5/9AyPX
	 VEGb/wwnWHXg3Pq7OcyV1qCDfNJEVCQNvrGeKrF27yOStauT3aIZ1ct1msTgOLvxV5Gbj
	 j7sYiqCvXsFk3Y+2ELWk5kVmIEUenFRuk1wyUKRJPwWCkhZxdpCJr2UIFCl0LWp27bK4G
	 PNy78Pz0tp9aIi0Mk8DKVnSBpFtDrlpAJaL0+FKqX6E4ORD+U8tQ95YEyLdwKmtiCtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485396;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=22y+5juPWrN/VuUPPX8ILqIV9NFhSiiV1mnmbGgPo50=;
	b=Y/mCw8mhj7hHk1pSfsDnDiFV9ivzzd7+2ezQ3PiZOmKsLP5t2HoHDP6+CrtGxCnUXjpI
	 jUzGD2+gA5zoMMjDFPVoBBGMaO6F5MdBZD/sJNxvd/B/ttiZUDokL+/IIuaXXCZ+TefnB
	 U3LiGk9fJ6ZoRwOmf8NBm7wFPI6nvcXGT1+h1YyLVgZo/cZ7t1HkLtOmuM+TvbDKucMo0
	 94SINf8/yD2RORSiUJglOLiE0XA2L0KGDC4+3UA5m67S+QC/seuGfLQ2gUFRxz1P/imZd
	 4klaH2XIvYQHBr4A9jrJ6FOhKzUUw+Oq6itvL+0VdN86DXawmUHkEikcZwOjy25n7ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5130606A31D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 08:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5130606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-78fb1fb9508so311747137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 01:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485395; x=1793090195;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=22y+5juPWrN/VuUPPX8ILqIV9NFhSiiV1mnmbGgPo50=;
        b=OYWVcn4UpekT4WMNt1EO7G93tLVi7Dzlnj+nhiLGfD+zGRfPyECb7uWgtmuW1ptmHa
         pSNaGvVzNxmB/kXapEQ31jEIXYTLeYOp3Lt182MqpklLf7Wl75shNIG7hbxfYwfCb8nf
         /NiVP3Bh2vvZo/60RIi9r1Pkqna9zlwyHxrTwghXadSt6yeyG1v/6UyfsNsCWP3z/qpY
         oG7TDcKvkIzg3kYJvAu7CoEpWWi0s4KTJOqdP/rEKZSrgxNEwasyLNh9ndxYqlvQjXUd
         7t8pagTVDH673E0eYpat3wwUPVCyv9EkDjSHaSKDnwQmE7hXRxfZT1CeH5YmHzCDfIsv
         6Q2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJg4v4nUhfY9Bo7dXetUtCOLJYMDHGUVz64Q6sRpuq34l+rJ5ioPscLPV0hTB6ub/Do+4mCXFEGSBR9lI3gUEtSg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK+wC0qAlDqcKeK86kQdTsA33oTInLNQYoE10X6aeDFgE5a0A4A
	xcpYqVaD+O/0LuFxcFub1K6eTDB9WZ7w578PsZTFYNCIDcJ61gzDcu/oCCLcgVepXiU=
X-Gm-Gg: AYBFou2xi1ehe52H3t7vINYYkfZpXg8CVRjTq8dbXyD7l7da35g4KjHM0D8qhkVy5Ew
	Ss38Fvoa5XCdft4TAMfd/QgHLaw9IQaTW0vlnaEaYt84y+FdOrFZkCW5Qpvt295LhjxfyWK5v75
	u1TFAkJXDYFWPdZ6toPp8BUaKsCjQTNWwcimg+qsngDEptlTGHx/HsRCsp3jtWmmtjOPvNbPIb+
	jrlP4rXbMaXuDKDOqiI2whzUU1C690GwARGSAz+HluS0i14t5HafSHDDCJlsccIsvF6jFHfEVUI
	PpMfFm4DaMyXddvwVA9fdnCyE5A8TRGSWeDEJ/KDXSfcfjZni9OoCXaZUUZRMx+nV441tmda2S4
	Z+oRY1UleJkoyhEhFzWGnILFAOM3dN4DJJtnldb0fhMds3Pcj1Q79gYLey5ZUlZkv0aqPCHJpud
	GMyLEOiWkdQw8pIjvpE+qDH//PfJPA5PLcS7bRSvYcRlHa2V6NNU2Aj1FPqnAah3oxJuaqjUNQJ
	NLH6H5apY9eZ9fuxQD6SVqwvyEBHhhBTmDFe7ra
X-Received: by 2002:a05:6102:a1da:10b0:7cc:38aa:63a with SMTP id ada2fe7eead31-7cc7bbe310amr220609137.17.1792485394582;
        Tue, 20 Oct 2026 01:36:34 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb25937dsm2392120241.1.2026.10.20.01.36.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:36:33 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so380945e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Oct 2026 01:36:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0fMvfaCiOeFhVDO2xMsmw+0tXunYXOq/USuxkl5ITBKK44DGx0pj36O3LfA0XQ2VaqGhFiNGH8SWCuETRTOdqTQ==@vger.kernel.org
X-Received: by 2002:a05:6122:8019:20b0:5ea:a09b:39cc with SMTP id
 71dfb90a1353d-5eadccde839mr253998e0c.19.1792485392657; Tue, 20 Oct 2026
 01:36:32 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019170139.473808-1-biju.das.jz@bp.renesas.com> <20261019170139.473808-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20261019170139.473808-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 10:36:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJAYL7L8q0ShxF8vJ-nhmyCiTgTNLJxLv9wLcshLfLGQ@mail.gmail.com>
X-Gm-Features: AclHuK-f5PxeHKGz-JsdxG5WRVgKsmMVDA3pua2BFWop-pdvR8thY-1maktQwAQ
Message-ID: <CAMuHMdVJAYL7L8q0ShxF8vJ-nhmyCiTgTNLJxLv9wLcshLfLGQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] serial: sh-sci: Skip TDxE status clear for PORT_SCI
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Au Dang <au.dang.jx@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Frank Li <Frank.Li@nxp.com>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Mon, 19 Oct 2026 at 19:01, Biju <biju.das.au@gmail.com> wrote:
> From: Au Dang <au.dang.jx@renesas.com>
>
> On PORT_SCI, the TDxE (Transmit Data Empty) flag in SCxSR is cleared
> automatically by hardware when data is written to TDR. Clearing it
> again from software via clear_SCxSR() generates a spurious TXI
> interrupt, which causes the last character to be transmitted twice.
>
> Skip the clear_SCxSR() call for PORT_SCI in sci_transmit_chars() and
> sci_poll_put_char(), as the hardware already handles it after each TDR
> write.
>
> Signed-off-by: Au Dang <au.dang.jx@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -913,7 +913,8 @@ static void sci_poll_put_char(struct uart_port *port, unsigned char c)
>         } while (!(status & SCxSR_TDxE(port)));
>
>         sci_serial_out(port, SCxTDR, c);
> -       s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));
> +       if (s->type != PORT_SCI)
> +               s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port) & ~SCxSR_TEND(port));

Is this issue present on both classic SCI and RZ RSCI?
s->ops->clear_SCxSR() points to either sci_clear_SCxSR() or
rsci_clear_CFC(). The former already has an internal check for
PORT_SCI, the latter has not. So probably it should be handled there.

>  }
>  #endif /* CONFIG_CONSOLE_POLL || CONFIG_SERIAL_SH_SCI_CONSOLE ||
>           CONFIG_SERIAL_SH_SCI_EARLYCON */
> @@ -1049,7 +1050,8 @@ static void sci_transmit_chars(struct uart_port *port)
>                 port->icount.tx++;
>         } while (--count > 0);
>
> -       s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
> +       if (s->type != PORT_SCI)
> +               s->ops->clear_SCxSR(port, SCxSR_TDxE_CLEAR(port));
>
>         if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
>                 uart_write_wakeup(port);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
