Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795836437;
	b=sPfjjX4lCmbTgTkVUxNoAapg/G9ar+1V9qqXUn723IXGBK09VWP025jWQQGun2lKHsBW
	 qDyBhwCyNWPvpMWoE9LU9Ii6DY0qYVDFLSdN3mPD2wsWIiQ+BiK2csniDK+U5IHBwNg54
	 DpqFd3h3mbO5K2Yv2CmQWRdKfNjdi+gS65/1/vDMPqBt6Dhj1C+m64ys8iOXY+/64uHAg
	 YBbWH4qHS5N7QoWJ1zHQcGv0rJAjFQ8KQ7VvqGqdeqM7zCfRweck42T5Wpa65I8nUpxGh
	 ySXc/mIbpxDbOugKx81EOf+dHchN7TsgwCcO7eSt100Z5pqQsTaC31Txelzvtw+vg0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795836437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vBHWdp137VAn7lA9+DpI0GObYR6F1NE7+wrNWZtHzuM=;
	b=NVHMoXg999MzJZEIpRNLbYIyHYjNH0nH+jdTOh1alVhKccwESebgFrj8lRU1wboe524T
	 CUIKvYIa7jWo7NO+NXdMAAo1GLD7zQDjDl8CFZfFZYsSBVyL04JdBCt+wP2omqW+zDBpt
	 gpCL1MJ/AkakniEi69NLd+Cmwklpni0uBRs9Y1xFKmmzk0zFu58Et2HnaspZK9v50pQtp
	 US3akx8p+VB934IBpOQ7VsrJQs2vtKmanQ+Y+J6cYLQBDhPm6uLUeaOBljf4xCJ7TRnbV
	 H7pOe8Hq0ZtXk8Hdvg5ir0eEk34Mdd59FY3TIF7d5F8cg8mBPd9sshDcNH8piErsW+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXKWfyuW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0D2606A31E
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Nov 2026 03:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF0D2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXKWfyuW
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so4269854b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2026 19:27:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795836436; cv=none;
        d=google.com; s=arc-20260327;
        b=eGvdpF3hQrxAveDoSBAUMTivxKuv6IrD4OSIOEjCv4685UwMyVbXpr/VQjtkq/sjwA
         KXhSTGSdmdM57c15Q7kaQZiwhTskrfdO3C8+p27qxDwRSn6aIZS8bQQjda9N07hoegRA
         kTPdaP/GGs+ROhRH5U4g04c3IosZBxqP8tJOudWndVq0hIHTerFop0fUBNEUv369e0i1
         a7ukABKpDZrXLM6lEay04gv92YhsvcCrJDqxglJ48BvLjtTUIUVsy4F2WGA56K4Cy5vi
         cL/0XdHOnRXaI3ZIIxhSSMvvYrt+uj2m9JuvlhFESD7f6NGtbuvJlGLodHdeGQaQH1zI
         VOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vBHWdp137VAn7lA9+DpI0GObYR6F1NE7+wrNWZtHzuM=;
        fh=kkujJLNAv5i8cM8wnI4dZHVU5h7qIf3kt/lO9f34zRI=;
        b=iPrKDFBqBmtO/9TX2ZN5+ZbHog4yeR0590xOawrhguXxMbMZ3M2h70zCvr2pXAOTVw
         TSkNyA/kSGf+bVVSal0dzJvcYggxEtUr03qD90XznnKde2+3XPt40ieghZoz0pddj7ZQ
         VarWxjxrD66u4uKJq4EPE3n9wPJAT6ROCl3goNSfhNljeHOFdTY8XLxnNoMBWoIy5NY5
         H3qLewdIm/ZqqmUu+iAJJWQqmLCmc5+oNri5D1rnu6lG6n57YiZt0GAvs9oBoLsYbbDE
         sSNeHqrXkvL1RYzUvzHVlrfENAoL4rlYRmsK6y/CVxMCsxejvWujBGQBl0UopvDikH2b
         oS8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795836436; x=1796441236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vBHWdp137VAn7lA9+DpI0GObYR6F1NE7+wrNWZtHzuM=;
        b=qXKWfyuW/twBZM5FnjFyDa6SXiNmJVI6bRpJbUOOmNXR3XOeC2xhWMLE+OsZDUjNRT
         xcIhN2wUyR69ViAGFwLQzjsyiI0vSE+z3iGLIv5RaW7u52Z0WkNPJePI6YSHTdJfRx+J
         9tB7g/ANuqcKHLKkizRkwoXqVu/W6+odlczbdd5gjhvi/9D3ejQ0T+2DVrPELsf6+/L7
         eXdJ9jaGH0JV741glAkjvjoPq67x5uInmSAW+4EgCvB/gL6MuvoKU8qJDrEsy6yKAghg
         X734SwWwTsHpb5HNH1GBSMFhu0KVxM+NSOvU+AGhTqDWWBbdjU3s1wH0WXVCGPFlgHnE
         7bOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795836436; x=1796441236;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBHWdp137VAn7lA9+DpI0GObYR6F1NE7+wrNWZtHzuM=;
        b=0ZsRdPWEIOoLJlC+u7awH/yWA1UIxQInV5J+lRy7ceutIF0zzTQ41F5u1f7C3xniUT
         8FH+WVLMtGW6eWL+oUW5WgWm0Q6RecDstM97Bqf3myrPu6Ai6xeXiETsuqZmvEgqW2jl
         plq6nZoYHwgp9NMkKOUu5IEnZKGEP97OoJT9Jci5H9+Gnd7RSPtQP4Y0LObpSJm73kRq
         /0c4xcVop0qkBKPmwAsKcYwf07sYeLuB90jVH4YENXz5dSpsrUCH6XDdjOwjeP3Ywzbs
         HDf+0+DN7ePeQuVRV+rIT/qLU6mLkESQ9mRGNFmYkqEAHX34eumeXtZlyPBUk7llkdi0
         WUmQ==
X-Forwarded-Encrypted: i=1; AL+hErF9HHtKfYaJfSpUxb+F3d+7NQUNirNbBRl+mpqLklnHjTjKhenUE+0CtEFbn1Zq/mJuyyoODuEL4fiGVFZoLmy5Cg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8+JVa8YHnrN3SVDCV7Vvc8qEQnF4oq3MvGuJDSK9pBvnlqcTcG
	7noeGm9Ps2ExGc3iumeEnV3I8uDYAXQPK6Gz3znvHk8pGpR4gvhhaJpwnudmZym3XBICAct/uOO
	31fCivaI6H3BH83YTls5AheMjLro8TPj/9yDo
X-Gm-Gg: AZFdTZfsgzYkvD3UdFsfaFV7UXTOCvnA9A3JbhwoISDltC2nxDVHR1sss6VNx6dBqPX
	G7lXa3NPUlNecZQ7URLv2EGrezaSqn2sQAjmxyAP4YOQXKCHiDe4noYVhNDlgkrkfqF93p/c+m7
	95GBLa1qrxjV/LBMho3wJgssQCaLiaD12UJEKueCw597do3UHMD+r1Ygp5v2lt78jG7q2ETLoLP
	Np8xCCvdyb+rJky5VcLfcmCfpyUQFo958G60qbt3/Et1QhvQJjiGEv8NzQQbNdaTYmsE1M9cmvq
	up3mh172yfQgwzoNliGwmnJEynad6fTLJXyH5kMgUUsAJtCz6zjhDQHkNFXOZofnsK8zy5w6dKQ
	YnL3mPuFPUz4S3wnxlYjnf9O8UMWBegNc2knGUOtlmki/6Ia056kt+rSVfcCTirbqM+ADD0+Npm
	nwjW72Fv2g5MtsyEzNO+/2hp8SOgEp9247BbKXBglmWYyq81Af0/GJ+086qtmzwEgzotuD124Y
X-Received: by 2002:a05:6a21:3b8d:b0:3e2:13e9:fbdf with SMTP id
 adf61e73a8af0-4014d4587ddmr27430610637.35.1795836436206; Fri, 27 Nov 2026
 19:27:16 -0800 (PST)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260707093004.987846-1-phucduc.bui@gmail.com> <avRbEGoPh3bqR93f@ninjato>
In-Reply-To: <avRbEGoPh3bqR93f@ninjato>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 28 Nov 2026 10:27:05 +0700
X-Gm-Features: Aa3M54p5j-n2pabLvPLN9nW_rTRNPtSo4v-MXvotIWyiblkPP7zdfuetqXMVZyQ
Message-ID: <CAABR9nFt8LDyupBiri3PxDTERAQM0qs+cRcM41TRo1gQVAu+fg@mail.gmail.com>
Subject: Re: [PATCH v4] drm: shmobile: Fix white screen after resume when LCDC
 is stopped
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 7:09=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Tue, Jul 07, 2026 at 04:30:04PM +0700, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > The LCDC on R8A7740 may show a completely white screen after resuming
> > from suspend (s2idle or s2ram).
> >
> > After resume, both Set A and Set B registers are reset to 0. As the
> > Frame End interrupt is not generated while the controller is stopped
> > (DO=3D0), the hardware register switching mechanism is not triggered.
> > Consequently, Set A remains at 0x00000000 even though a valid Start
> > Address is written to Set B, resulting in a white screen.
> >
> > This is a timing-dependent race condition. In some configurations,
> > debug options slow down the resume path enough for a Frame End
> > interrupt to occur, which can mask the issue.
> >
> > Fix this by priming both register sets with the Start Address while the
> > controller is stopped, ensuring a valid base address is available
> > immediately after resume.
> >
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
> >
> > Note:
> > It was originally posted in March and has already received both
> > Reviewed-by and Tested-by tags. I'm resending it to bring it back
> > to attention in case it was overlooked.
> >
> > Changes in v4:
> >  - No functional changes.
> >  - Resend.
>
> Still not upstream? Who is the person to pick this up? This is a
> valuable fix we surely want to have.
>

This issue had been around for over 10 years, and it took me two
weeks to track it down and fix it. It's also been about eight months
since I sent the v1 patch in March.
Hopefully, the relevant maintainer will consider picking it up.
