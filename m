Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939133594A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441184; cv=none; b=p91HXzUgmTpVH4wMr+JqVqYO1pZXGRtv7XCwCkjIC9iusQyp6nS/FaEwAFlL6orHpt+Sn8/TnHuxu5qivDGZ5gLxfBXyZBFBMq3/yRb2jfRn6z041xUiHk6JyWwkHI1UQZcrGKXFJhekPyfSqvz/XbAhB3pRkjxn4563TyLNZ1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441184; c=relaxed/simple;
	bh=7OIaVGego7Bmga9WLfxgUrf716J/7LdK97t1FI1saiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSPd4pUZ9kJVQDyLkcwxMb88GlK+sphJoZJSsUbAJ/gTlQFNv8VeOjE20LxS8zF2kXJUJrPiCHRCgZQwiGKjE/UDHmnHPBROYiW3TVDNuUkGnVMDtwryD6D4oLrJ8FsJOFKz7hew8nR4xOyOHXlHCejRlvUld4O7MnGPfrC+ryw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-57533363201so2279490e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 02:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779441182; x=1780045982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/zgv+5xR1Uk+GFWC7cjZ0OxT05TRQfckCT8Qxj8k2o=;
        b=G2Ppizc2cUMaIr3fw58v9mu6uLcEl5sKFJokoopmem8xAsv1wkXcCFZ61nQuk8QoRA
         SggzqP3odSoRezFMM3+ZTBX3YvxyyDr7qmarlFO294014RL7S0/3jI0Ng/opRVx3qxGE
         tJek9upMRQGDkMtPEi4CRMrZ2X/NRR7bKG6Gkv9N4Zvvm2i8uC2JjRT8VWYOqI3yQHI+
         1in8wuj4T0aXyFhg+gg4C7MEjhUG0R/K8MM+ngHc46mu6781DM80tAlxyu1ZkzKpBBAV
         abCr1dulUh3d9ko2wRDypDG2C5gz7H3aZ6lgE3K1mxY+w4Pi+J7NmIvg7AWn4X8MG6yJ
         Skxw==
X-Forwarded-Encrypted: i=1; AFNElJ+dUJWz054EBwZl15z750/G7BK/viML4elro75AUziI7NLSFgBp0xYLj0mbHJqnHyyaQdPQNVlUeN5wHfilauRqaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5vmZk16jhhE8WpUeqLhCXeSPUXNu6AM6oqc5DHOxgydN83GHA
	BWaOL+OHGTQS4DlalCw5cXm4z66oLiu/y4PZP3sRf5RlPGO7LQiWyveoIRXqjEAh
X-Gm-Gg: Acq92OHj9Y15Cj8ccI4RKj8oAzEzbPjPqnj5wg7DfOtQ6TJnwuJc+wk2ZgGCcabZCFR
	iICRYM5X+cddAPUxCBsudCjtcmLQVuQTo2aI7VTauJWF9GvTveJxTRb2fZuvlBJd1YcKvwzz44o
	cbaqri/niqxzy3M4JAPaE2U36TpALImcbBTpb/xW60iJAiQeTI+DmeR7v3nUTReUO+AJ5663dIi
	fAIu+vx1iDQMQUmmBZ1i2/wAignlir4OMpsQn73DojQEY1z7wJ2gDEk3DQVX7iXRjPn0c9sQV9g
	7Q8efnzuqFFYc8nSyNeoMoBXwDnkodGXutBZhyvy7UWnBBBe4vS9MXI+PmH2sGgmVZhymHVaRJD
	q94ebl15Uc6G7qXc1a3efYKERP9mveGVCzWHgKCvp+Ky9fCW8xaFUDwq3QP6weV57/glo1D7L+B
	np/g/NAIRsOUZt0XbvRqpuk/nu2jTAjAWAiWb+ZpP/SgtwqrgN+L9Tlmz6wcxr704t
X-Received: by 2002:a05:6122:3214:b0:56f:2609:cd95 with SMTP id 71dfb90a1353d-586626bd8acmr1424131e0c.9.1779441182482;
        Fri, 22 May 2026 02:13:02 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f791f70esm1410624e0c.10.2026.05.22.02.13.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:13:02 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-57611a6a69eso2091113e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 02:13:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+OROYQGvd6+Z/U+W/EfSiOTHUCX9UlLrHmYiPPUqy+Snbzw9c4R8dzagzZQOa++LGFGGaDd8IAr5rO31dvqHeIOA==@vger.kernel.org
X-Received: by 2002:a05:6122:2404:b0:575:e902:bf83 with SMTP id
 71dfb90a1353d-586590103ffmr1411914e0c.0.1779441181704; Fri, 22 May 2026
 02:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515124008.2947838-1-claudiu.beznea@kernel.org>
In-Reply-To: <20260515124008.2947838-1-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 11:12:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVFTszJPqJFRWCHZ1jJy_DupU_CAvwBg47qRwoBNDq7-g@mail.gmail.com>
X-Gm-Features: AVHnY4LRkwsnpQYlofnnFlc_xtD9lz2efPBJbAPdjE_1-F4moB3JwvUPUH9JoZk
Message-ID: <CAMuHMdVFTszJPqJFRWCHZ1jJy_DupU_CAvwBg47qRwoBNDq7-g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: renesas: rzg2l: Populate GPIO set_config
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: geert+renesas@glider.be, linusw@kernel.org, brgl@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, biju.das.jz@bp.renesas.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Fri, 15 May 2026 at 14:40, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Series populates the struct gpio_chip::set_config for the Renesas RZ/G2L
> pinctrl driver.
>
> Thank you,
> Claudiu
>
> Changes in v2:
> - used gpiochip_generic_config()
> - fixed the return code for unsupported operation which helped in using
>   the gpiochip_generic_config()

Thanks, this doesn't regress on RZ/Five, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
