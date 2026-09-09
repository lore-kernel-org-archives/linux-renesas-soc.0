Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E6347FAFB
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Sep 2026 13:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958949; cv=none; b=OkaYEuAMO6dz1UXSvuQA3mwIUYTxaFGUBxA/2luIFB15tlLdewLQIypfEFSJhxZ1+bLwzWOPApzjv+x4flnS6BgoxW8WSodsvQabmPlr/yWClfCKezq/7H0i4jeqYJ71kC4iWCbXle48PUr2XHxA8ZVSg9d3mae7lrsX7cddSts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958949; c=relaxed/simple;
	bh=/C6xrd9DbZMudWsoB9J5FkarnDq/7auYeoCE6cSV8gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M0pqXhNbBHHnxuwctu46D0StvRg7ZOMU+UHIl/B9IYZOK8Xt8kIirJ4MvGWblw8PfFr7QOgxc2w5ceKRao4hDkdV204qiZ4st628Yrz9Ss5MvACNdScbrrfybBR1d5ObtnnMMNTc+dSiYibPd76ANOaCZpK+X5wQgRqmz9WNrew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7b731cso419740241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 06:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958946; x=1789563746;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nJR6HyF8ZJeLa/LqcU4N2hRWBO69asEjLiBxq381+d4=;
        b=nlzZkdKz5U9HibFCo1ZroC9rkVdphu5SEReVNh8YBAKVLamOaQx1Hg2MwJz4tycRWz
         yzpYo7GkVJcPyXMDvRCtnrspQx0biXbjrg/s4Tubsi2OaxxDTKyTsDwdgVKOqbHsXbjc
         Lm/N2Sp/idYta8mrX3uujNXNTgb/rNppanw4d2nZ0qCi5wNXHJOC1Zf3Jk56Ywi3Kme1
         F9Bs3m2oXKydRfqN+AVG1xHNohr3cOHwz9V7Gp/nT+54NrYf4OmAGmq4penX7Mbd+R43
         xINjvM69Hu5gYJXIX3lsMFC10sEND3tGKCnMXRrqCKGnJNDEqLYWPjKbiSWAMp10z8s/
         b5fw==
X-Gm-Message-State: AFuF++lozauTrhMrf5YdFGcHGFyh+/9/9Vd6222kmf6dgG0+HWyh/rHw
	wc5N89BPi8u40HiFnKBNENYJRAJij+Pi1Mb23Bu+039DCe/WkQC7lGFiy94eLbnzGO4=
X-Gm-Gg: AYBFou0znLLvdcBl2yFH3OYcrPkH/5cjxSkIbPmUiukroLRqxPHqk0WgdOF90by3r8y
	XoBd/cuD9A+bGzkPHgdquRk+nY6tDr2sfcUn3xlV9xZiBiCa3/h8s9iBhuF7PGqj6CuaivfbCwg
	KpPl9LXhlnN0uxUNlGDUI9iGEHJfDYQlU9o8BTGMnjXsdxjtjM0NULQ34YWoYf9cFJGEG8zWxSP
	bZSPOfUPRPve1RQZDxyKpfuzfvMnbi0eDHxM6yy5/UItZZ0yalzLub7dxR3C6R+aDKlosRoZqTb
	Cuv638kQ6M4ORajm2QLOjfioCi5EK5HxfAiV6AHIfYi/YFWMLKJedwHKeuau816i7Aj3PdhjtZi
	ActpGmF7niOkrXlDMYcf1KpseEucVI5HNQgQOrQYOlZKzbJ58BXC9acZEkyGzNB/HtFnUB5tF8k
	+n5BOn9knBCxp484gUXE/Ivdcb5UztbnpOgFu5zVGe1K44dOLdxri3R97pdnQOM8dTUf8CQJHlj
	Y4TdKa9mffRGWXvEAPdhe73brOkOzXDt4od
X-Received: by 2002:a05:6122:8ca:b0:5c7:f1ba:aa12 with SMTP id 71dfb90a1353d-5c81a890efemr4434854e0c.4.1788958946428;
        Wed, 09 Sep 2026 06:02:26 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ecac1033sm12388019e0c.18.2026.09.09.06.02.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:02:26 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-78a220b5778so4518196137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2026 06:02:25 -0700 (PDT)
X-Received: by 2002:a05:6102:8345:20b0:777:2e1b:1e2e with SMTP id
 ada2fe7eead31-78a2ed7ca4fmr9262680137.3.1788958943502; Wed, 09 Sep 2026
 06:02:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909094009.2167-6-wsa+renesas@sang-engineering.com> <20260909094009.2167-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260909094009.2167-8-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 15:02:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJxYsnaenSicPah3cSNXuB3GgQGhZEMcrpeTmmZ73E0w@mail.gmail.com>
X-Gm-Features: AcwNN1UzAXJ6JxDGHbzclDkC6NkeZ4YlTjwaw2VNH8RHPjBoi3xfLyeksmcDlLU
Message-ID: <CAMuHMdVJxYsnaenSicPah3cSNXuB3GgQGhZEMcrpeTmmZ73E0w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dmaengine: sh: rcar-dmac: SMMU doesn't need IPMMU workaround
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 11:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> R-Car Gen5 doesn't use an IPMMU anymore, but a SMMU. So, the workaround
> for the IPMMU becomes optional. Add a flag to distinguish. No functional
> change.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>
> Changes since v1:
> * tags added (Thanks Frank)
> * renamed the flag-variable (Thanks Geert)
> * added a comment that Gen4 might not be affected

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
