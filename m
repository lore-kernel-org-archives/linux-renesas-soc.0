Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89D144236E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Sep 2026 08:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771136; cv=none; b=Ed3i/iNv85Ik8PZJHEoYqQlGu7F9pQVC1Awz2zFC5Cb6go2HvypN/ETLMOjLG6A46InFk9L/9oHu9+dwXvGu1NdK3qOpivV1bvFBb1xzmhUOF+q7TIXabqdihsyMAYS+MHzHjyJNFFTZY+YlDak8dIwTbdEuALQdCJMo1+8WP7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771136; c=relaxed/simple;
	bh=5hkNg/DdppWmt9hRq7+Z94tl0DqiwznZATxfNYQvFw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kyxO+fBkseDdCW2OUzETclIzOI/0OG+41S1HOiCigh70aWSih86o0zEmLpd/rnEXFEBGzt4js/vkEmd7Y8orAa6S/hE96KpiV1q3OLLduCHCJCNOaD4LFqitzEYzVH+vo6ZObMjdR/yfJRzwlULTZo5Q0gBVyBoVPApgF0Vxutc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5c7d4c663e9so2567302e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Sep 2026 01:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771131; x=1789375931;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q+3r2vTpl7vurYEZDFRXrOxst0eBJYiAPGsJmJC4qoY=;
        b=auT3w2TqNjXrK8W0n0uczG2ZtE7hviwmU1z0n0ocUTm8rhNgUJjC61eQ2sDdAeeEyA
         0CSXGd6fSNs21qSVeSNkyv+GiMKWQ2qOvZapaRxrHXaaGXFHb2HWQ5ZKMhxI1qvzww3J
         nSEFM8xOMEkyUgjBZ9bpdIU0ufjrnSyjWppsL60R0obcRNaeofh9k0uWdy2dKPIJECUo
         RvIs7PZJotvksQVWjFwGe9NV83YZsGZLpv+0gTmQ87Ntt76FHVGuJUwx9/J1kJl9shzc
         uXriR9DqO55O2Ylj70zJiir0k84AkuF/KYb7kgS4DdU3+qk/93E85g1KkD+XRp/uUaRO
         gBeg==
X-Gm-Message-State: AFuF++kKYTww30tedIcltzN64TT29NVY5fA42HcBTR5yVvregQ1jsIHa
	zDxyXbg50T6hsFhn5NNfM6cEApL7YmeCIQsgKbeinhBEXDoiVwhdFDF4VkWScusQ
X-Gm-Gg: AYBFou2Mbe+XdWu2OxjczAMilfIEF5PM86em5wJBKpm8hKZq5gGqNvWaQBlHLuCVZ/2
	qGXu7jphJz9GAzhwpR5qwdGlaZ8TGw19qE4kW6m/DXHihliwBynvWZVrQW0f8v/oFUcm8UzPRCd
	ljtHJMuuviDHM04u7e8YgIjdsF8+jdYutWTLZBmx60p5oaAYtRSufpkzNQLRZCppgKanGqcsVyk
	wtBJPDI6mkzwGj/NHDsX2DM+JkjR7V7mbkFh4anwcLT5ELYt9ObYgr1xhBWv0HUki3IydjlQQMt
	D9iYlzLiYBVJ3svmySo++dlcYKhvQ+dnwQUBZN01ZS+UGUIvInheWbzVxTBpBg9JVLnMpC19T0r
	nDpo1j040/RYSjRSRt9avjD9e0ys1IzVsohXD1t4qpvpBeGEGc3cXXRPc4hqebFfPPwm4KpQShw
	RFb86Pz+qUIKt61c3/IHLok+kzMlEmvnZByUx/UQd5exOgCoAoMbzhmHMMWz1v9g78V4ukhm1/C
	A1oHGUgXj1uhQDR1FyecMLlDw==
X-Received: by 2002:a05:6122:2213:b0:5bf:9bfa:53a0 with SMTP id 71dfb90a1353d-5c7ed50c3demr11540536e0c.1.1788771130978;
        Mon, 07 Sep 2026 01:52:10 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ecac1033sm7389893e0c.18.2026.09.07.01.52.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:52:10 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-783d429d0cfso2454934137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Sep 2026 01:52:10 -0700 (PDT)
X-Received: by 2002:a05:6102:e0d:b0:789:5b58:e105 with SMTP id
 ada2fe7eead31-78a4a90fdd3mr9303394137.2.1788771130230; Mon, 07 Sep 2026
 01:52:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817095447.34693-3-wsa+renesas@sang-engineering.com> <CAMuHMdV3OddS_FLezhLKL7Bfrw38PFAv+pNLvza5wt4bE5kP1w@mail.gmail.com>
In-Reply-To: <CAMuHMdV3OddS_FLezhLKL7Bfrw38PFAv+pNLvza5wt4bE5kP1w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 10:51:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVL=+ZJbiGAhr8ydMhtZpXS0VXB4HVBccPLi8tbmQibVQ@mail.gmail.com>
X-Gm-Features: AcwNN1X9BL8rCmnu3zIP96gRaaLUUi-0Pp8fmnpm5GVndMU9NzYXjg5-zqHMACY
Message-ID: <CAMuHMdVL=+ZJbiGAhr8ydMhtZpXS0VXB4HVBccPLi8tbmQibVQ@mail.gmail.com>
Subject: Re: [PATCH v3] soc: renesas: rcar-mfis: add hwspinlock support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 14:12, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 17 Aug 2026 at 11:55, Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Every MFIS instance has a block of hardware spinlocks. Add support for
> > them. Gen4 has only one instance, so the base_id is always 0. Gen5 has
> > multiple instances, so the base_id has to be encoded in the info
> > description. Also being a provider, a hwspinlock-private header needs
> > to be included. Work to refactor the headers is on-going, but will need
> > many preparational steps. Until then, we need to live with the special
> > include.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Changes since v2:
> > * dropped patch 1 because Geert already queued it
> > * add comment that flex array must be last (Geert)
> > * calc local_id in a less scary way (Geert)
>
> Thanks for the update!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Any feedback from the hwspinlock people? Can I queue this in
> renesas-devel?

Queuing in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
