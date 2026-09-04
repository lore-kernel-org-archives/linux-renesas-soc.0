Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3517C455628
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2026 15:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535131; cv=none; b=Hm/yHECI/AJCBwUe9L0rMwTd4me5cUtmA1R+lvFZZv/Z0wrDwlRlcSz2i2uYgb/6Cp+ldM/nTe1RFFdAINM8bfrirXVY7SMDbaJ9I3qwU4B/gsKKe1XNacSHng4dJpZ0YVj6aZmgIEwdvvrIMBDe663q/hnQQliVWsad19NeyZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535131; c=relaxed/simple;
	bh=JKMK2CnzL8ftNzdqEBL6ZbY15a40r3hgTJf4pBsjvSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bHgm2tNhDWGlPXYaRB0LiR87iL/U9PkkRSr16Zf4NCQL1lUOARWPbTm6p53se3fC7CpFLGtxZNrvnrNlkFBOvxt1ITCsvPDlgoJfaHhBl0EewWiNsJevs+mbtQSbfOUqixlA2SnwciHvTrfPFKCoLOB4Ku05i+9DmiqyVTtB7Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8534d507f59so1260003b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535129; x=1789139929;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EH26aGan0gGqVYE0IjLU+OD6hNNld1CIjczwNKp7Quo=;
        b=nvt0vUpQFunrFnt2gypy6OsUyYkeA9PbdC7jNdLK0AU5+NLXbRCPyWxCj6PlP0sVPb
         NujIuYqSVwh4znUcD3a5F4DcUH+mwNwlnI7BH+PzQ5ej249atkgt9nAKRN/u3yKx/g74
         8monWMGZC5Qo7GIXIEKqpjH7S3rHya/iQQQakDyhZyWzZAnLhrIUTqEQ7OhO2/o4NPcZ
         G6C2BKXZZKEvsaffSGZUCqI3+ln6XaW/OSYZP+RO0K9VVxgUENoAsrnKQABZL2CgpESh
         zvKEdPXnl4O6x4eyeMDhtLbpsTUzAZSA03+40VbX+nEi+kJz8DDhl6jAiQroui9+qOEz
         mMGw==
X-Forwarded-Encrypted: i=1; AKwUvBwby7jJCbbYyKTgtcf0XnRS+/nZikmLmChSdwTLXMvrPTQzlfeouLp88QhvLMCWhAzkSMCHD7PyyfD3igYhim6RHg==@vger.kernel.org
X-Gm-Message-State: AFuF++lk/109ilgG8pjsnUxf2U9d2yJfITdc8nHVoeFQ0L8r400wIvzS
	56KAg4ZfPKNF5vmKQtrbMkCkKWIrLyQ0Eo92t7ekieC52Ps9VU+5mjnqYcHBtAF2
X-Gm-Gg: AYBFou0lQpPCev2sJn1oo2qZ3yjohUcohK9dgpzAvqZ/Yy3RkwGEkgivs1mATX4x7hl
	82J3XU6GO6F3Qc69sgNLVHaQkD+XM6YVDP4+Px9Uc9k2C6/wq38gsyzEsLZALJCEqagV4Ipg9fR
	rceDv4dkMr7cDqMD9z32fM1ac/b24wapZY17gOOe/NYP+wYNTMV6TFSh5aqD6G0N1w6jUx/5BQ4
	UKrwSwzx+TSDmdMZ8tYCJeogvQqiHha1UMlanPt7jeH5Fk+gt5KMcqXg4uZt260PTYUxbQ3Ag9A
	aY6m0ViLVaCum2Eylu2CaBxLW90dM1LR9AbmBjj/JpS/5xx2rh1hjDL5OfyTIjKkdCPRlddtitM
	VDOiDqTjOUzXrjtMaO+wRdu2Vf8OmwHPCuaaAsofZ+8Dp0cgltOsHKhynB0S7OtRyvrs+AHcuwm
	mv8u3jH79Nbc8H53jqmjhD1+N75sHAX8l+FJRECW+glvbtvBwnQh3MlTLZpxcCFktE3XaLfQ3xO
	+RrAfX0Kf8nkCw7lzysigZpp2lLGg==
X-Received: by 2002:a05:6a21:6e95:b0:3cc:f008:8123 with SMTP id adf61e73a8af0-3da39ec3ebamr10942274637.8.1788535129371;
        Fri, 04 Sep 2026 08:18:49 -0700 (PDT)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com. [209.85.215.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc455405cfasm1012095a12.8.2026.09.04.08.18.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:18:49 -0700 (PDT)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca7c1176317so985072a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Sep 2026 08:18:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzWvrMfDNTEOkPEgXWE9sSKcqA7kMDqZyh3BQXiPy4BLvbEyngcOOK628m61rgS7DkDm1A17PgsBvAgO+tTGnQNvg==@vger.kernel.org
X-Received: by 2002:a05:6102:2b9c:b0:784:b9ec:913f with SMTP id
 ada2fe7eead31-78a4a6c8e9cmr2072720137.5.1788534796061; Fri, 04 Sep 2026
 08:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com> <20260821150408.73829-7-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260821150408.73829-7-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 17:13:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOLRH5CWwUBkb6odaX=4t6eDnd4onrkgGfvwgPc37i_w@mail.gmail.com>
X-Gm-Features: AcwNN1VLaUGS5m2MWtdAilN8Kk2snIGRLTUTYNqUMsLJBTkMdKQbkgJo-6rNerQ
Message-ID: <CAMuHMdWOLRH5CWwUBkb6odaX=4t6eDnd4onrkgGfvwgPc37i_w@mail.gmail.com>
Subject: Re: [PATCH 06/10] dt-bindings: clock: Add r8a774a3 CPG Core Clock definitions
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Ayman,

On Fri, 21 Aug 2026 at 17:05, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add all the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC Clock Pulse
> Generator Core Clock Outputs, as listed in Table 11.3 ("List of Clocks
> [RZ/G2M V1.3, RZ/G2M V3.0]") of the RZ/G2 Hardware User's Manual.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/include/dt-bindings/clock/r8a774a3-cpg-mssr.h

Missing "renesas," vendor prefix.

> @@ -0,0 +1,59 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R8A774A3_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R8A774A3_CPG_MSSR_H__

Missing "RENESAS_" vendor prefix.

For the contents:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
