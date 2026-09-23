Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D28A4AEBC0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 11:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790163925; cv=none; b=tVCyvUDd+3O8V60udGkbQjuhD8MXDPFLR9MSbjuAzDvyNBCM0q9L4MJg9lPKwGqXk14rGOji+4u9dLIUPW47f1OfFXJUZp+d2v2GboHFrloBUIawW/O73WZfYbkBstKvoPocl6dfKREBoR8HgOCG0sCPLHzkBteNpiYsFb6UiQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790163925; c=relaxed/simple;
	bh=qaYwF3YTeK9Wi1Phlhw0Z5y5kCe2NZCu2c8tBmHa3EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSbV+h6/hcu3pdrLPoqztpABx3jpSU3a6lnbPybj9Zzo7iD+v8O6x6ZHLBUteqyLnsA7lz9Ld0V8B/GAdXhuIHxTT3w+SKO+Kz3l9FFXVc4wRec2CVRviR+cSJZ/jBMzN5GstkLm+ATyWP9vSk64nuv7Jhp9q7GSyNgi/p4LlgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9851d513a70so240056241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 04:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790163916; x=1790768716;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q8PGd4XOq7wfScnN+X4IsZNJiCrIHxCuJIp0rtqKSow=;
        b=sEXYFqBFt8Th9uE1ZDl+z3Q91fy80cYk8gZTF/Fc8HZz2gYkjLIOmep/d8C5a5D70f
         dQlRe9YQ9aFqL+vPuhhRR7V/5iveaVOfdiv5iUIGae5xCOFohq1urvCbL6GsnQajC2Gp
         CB0OKxP0yuLdcDsWkEpfg6Sf7b33d/qXNjKTOn427SPD8A0iDGanGpIWvR9oLCqn+c6U
         8MDjkYgXqV0Zr6w22rein7/aXQtS4swrJc0N7ciY1IMIQQ+ym59cw0R7DRloilS74c/v
         zAIPejPr0i4hzSPWlTTPfU50LpSK3xTCxrQZ04IJhnFHqnDXSmNqKLKgnfgi/x6Y8TOS
         ZI7w==
X-Forwarded-Encrypted: i=1; AKwUvBy/zOpnVuZHXZoSvWO/IuokXUYO/oprJmaCyPX8BQr0PDdcGnbYweWg3N/Uf3Qek1O/1HckjWQnx55bolFpxCn81g==@vger.kernel.org
X-Gm-Message-State: AFuF++lETMOLIe/FJDVuM/4YzDugaLd5BoKZPQ4ixOXSlk+kaI9SO+ZZ
	JmSXr/BPI8dQKKVe6m3AEqCDGSIjTZx/URRxOKTPiJ3XxHXfmI3TonJJbyxZPTexpvU=
X-Gm-Gg: AYBFou3VXiqbuVwfbdRdYU0i9fCXj+kEVYrFfTb5SyRD7OdLUkqcDcfiCivrPUXvdn4
	Qdd7uDyDJaZaTlPdf8OdTrAYHtoliF1CMq+VNyX9YHfH5u7cmYyeDOctuc2J4BSaW3OldJ14hQV
	BzTQTsF9dhSloE0gGt8RKixsWaydmPgltkg5LhCrr6NBgXHoE5C525k6TiFlR3NN02ouqa7b3ll
	gkzPNcBS2cw0jmPzAWAqJWxx2mz/cUTrhfGLtfcd347doSWNgq2eyHOzzx1IYjHRyUo7NSJge2c
	XGvuJPI2kyf4qvxhSGX+azvd4Cnm/txzqSByLpjUs2PofhZQy8tANLaLiPomuCP7lzJAFvZrssf
	Mh2rcUCzXjYbKwQvq7w6u650BtH3jD9GMu7oN8Zwit5qBuWt8lBS7oVxrnFD11BG8oYYnXpYHlQ
	fPT9fkGQKNqYZ/WS+A+zoD6dVjNRB3XVXO6DvHJ0Y+TJxVyAE4B7Zkbc9J7ts2UkvMAiH78CU9W
	TpzAkDB7vgld0ah9fAcsWjFBhAOaSOitDx+
X-Received: by 2002:a05:6102:3ec3:b0:7a5:7282:19ac with SMTP id ada2fe7eead31-7ac1b00041fmr2508869137.2.1790163915877;
        Wed, 23 Sep 2026 04:45:15 -0700 (PDT)
Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com. [74.125.227.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf5674f44sm3061144137.3.2026.09.23.04.45.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:45:14 -0700 (PDT)
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c98dc46a95so622117e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 04:45:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzGPQbqUxPV0QdYnnuOQOeGWZ/aZPiABrmKHmX++EPxXe6MJU5+MSOmqIfQ6kyba1sPGcOSdlPU8rUG6X0xzC9bHA==@vger.kernel.org
X-Received: by 2002:a05:6102:4b04:b0:7a8:46fb:eb3e with SMTP id
 ada2fe7eead31-7ac1e45b0aamr2126477137.36.1790163913085; Wed, 23 Sep 2026
 04:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
 <20260921134432.50338-4-ayman.chaudhry.kc@renesas.com> <CAMuHMdVkh_qpJKqD7N=njG+35gS+rE7cFfWQ-kS3aRoTByxH_Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVkh_qpJKqD7N=njG+35gS+rE7cFfWQ-kS3aRoTByxH_Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 13:45:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmJWu5DD5sQ0epWX8FnWc7zt0CTvJ5_jpjj-Hnvgg_cw@mail.gmail.com>
X-Gm-Features: AclHuK8RxVewtu2RzsoGD8diwlu0sy6STWZ6sjM0IUtrbgAydvfKpy5BJVcpi7M
Message-ID: <CAMuHMdXmJWu5DD5sQ0epWX8FnWc7zt0CTvJ5_jpjj-Hnvgg_cw@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] pmdomain: renesas: rcar-sys: Add r8a774a3 support
To: Ulf Hansson <ulfh@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ulf,

On Wed, 23 Sept 2026 at 12:33, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
> <ayman.chaudhry.kc@renesas.com> wrote:
> > Add support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC power areas
> > to the R-Car SYSC driver. The RZ/G2M v3.0 SYSC is similar to the RZ/G2M
> > v1.3 SYSC, however it lacks the A2VC0 power area.
> >
> > Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v1->v2:
> > - Added space before closing brace for `ca57-cpu1` area
> > - Updated include path to SYSC dt-bindings
> > - Added Reviewed-by tag
>
> As this has a hard dependency on "[PATCH v2 2/9] dt-bindings: power:
> Add r8a774a3 SYSC power domain definitions", I will provide a shared
> branch with the dependency to Ulf.

Alternatively, I can just collect all pmdomain patches in this series
in renesas-pmdomain for v7.4, and send a PR for that, similar to what
I do for clk and pinctrl.  Up to you...

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
