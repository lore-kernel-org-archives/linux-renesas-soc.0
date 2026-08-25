Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BDD470EB6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663864; cv=none; b=dLUZhou4wD+dGqkMFXUo2VBkpJMg5gFQQ0KLWWtQwGaGOvZle9vULPnrFi8U9QYgQDcnk35MWYPbXAhSpiItzudv63hWTD/0lKZkSbvp8pXysGCWFbLD4thRlDUJigZiv/6U6C9VZMxlYFiGcHuEcDtJpGxZdgVp34h99FicMm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663864; c=relaxed/simple;
	bh=g2sHAATEnIjD9gAOcncDmOdMf0+ZUwevuRsByoswNfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oNvsl0+22sSpR0SLaBQQmKDTuef99rgfH7mI72r1YNB1UkxXLQefP6QsjxBHk8jQFfrXbcE8JBu/Ylr+++NH/lzVJmLIRuVtjH+NECX+6zRyaD5iq2YSATQiXfkoj6La25vPi9AMHzh3EZv9b9JjYIt3k9jURfdnK1w8cDxkY+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1600d040e4so123770166b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 06:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787663861; x=1788268661;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IJm+4jafzibqolHerE78hJ1wHg6O5UxVoBQiVXfM3qo=;
        b=ZJQN3CCoOCmsxZqRdiHSZb/jXWAJ521MVpCzI2ANEpS3oCzpGLQBcB23WSTahp3Wb9
         jp+phfi6+VhcosIy7CPb0MGkbrSrIrZMgMmA7Gk0YMr6RpT3rkKuHKY3gvUzlSQcZsFy
         zw+G0mrMqZXllLwm5stElfek9CJwLOAgJBQg8Q0rWV8Y7mSR6Z0+IGtVgjkg/qBmPQHd
         kXvTJBHcgha2hqr8s2HvTwxT9HptbYexgHaGJJv3H3ulXbMBfKsIxRfyQERqKWjKkm+Z
         Mzc3H4LHXPCnv3+qPHB6JF70DU1XrNuV+mXEbOygKbvgPIfV5PMcW+hSSR2BjrV9EF8s
         3DXw==
X-Forwarded-Encrypted: i=1; AHgh+RplS5HsYreACk3o40i+YhJtBVXLIAg4tY8lU6gnjlKa4Yq2FBTbaNMvwD5qlygKESrW2Y5M0EjXqqjYlx90IqsJxg==@vger.kernel.org
X-Gm-Message-State: AFuF++mbO3vxaa8jmDH4PU4cTVMRh+ucnn5dOifznLRERNqO5ZH1wlCe
	6iLgdWw7szecVnkG3SkMhPfa6Y3tz1aHMGxlclD/NYvkX1qb5vBuyVGvfz4gcuAKc9I=
X-Gm-Gg: AR+sD10V5YihOMQncQxdbftQOAEKndNwK85pWCTMaUehpji0la0wrHXPuhRAfXIbzGa
	LOZOyz9/stHP+K26l6mzf9ZukLf/mcP4iNFFBWJH+jQ1VS/U4Algd69V+ZuXFsdOKsEENIOBppF
	Yqog+OZ52775vfe/GSyFWiTXl/d2wbd/5dE+3Deh6dtEkWILyTG5ln8Q/QRjLaJNVvO5WoJHEEW
	L4eQLmLFUu7ovUmIVlWxnWwm99D5N7eEgu7WSe0mehk58qZnM3s3SjTSCaD71cGGCGQRCgXKXbb
	rvuCwEMBVUOf8fwn+XOXbHFW7O+WOm1HdGS/M8SWte0MS7JYDfmWyS9chJlUuJnx4nKtKdjs7CC
	818W5B+ZJ5RH1yXFSA7ThMEqT5ThPP0CY0b3DvojeLVAkIhcQ+wigoHcrVGXZ8+5rSwP+n6C5YS
	juXOREFbksc8QupBzzXj9zLkBKnpte3d9POMLMCqOfUDTAuxu3LbTgh5+33f3YQdfbEPoQf4PtI
	/+FxjOgtSUY/1vuWoMFDP07Zgezap+hv/mj
X-Received: by 2002:a17:906:5147:20b0:c25:58e:8d64 with SMTP id a640c23a62f3a-c25058e9f37mr113274466b.12.1787663860475;
        Tue, 25 Aug 2026 06:17:40 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496297c7dsm1737085766b.20.2026.08.25.06.17.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:17:38 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a386a34603so1990067a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Aug 2026 06:17:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrr/5blmULC+o8J9JSU+UYsxcXHBOWAtyYVk6o1IOf9q3H/HZ7eb+MhlVLTpZwxpbCBqi0JgBH464JVF/QNf++uoQ==@vger.kernel.org
X-Received: by 2002:a05:6402:a50b:10b0:6a1:8b83:8f3f with SMTP id
 4fb4d7f45d1cf-6a5c3f70aa3mr5115739a12.10.1787663857968; Tue, 25 Aug 2026
 06:17:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520131206.932050-1-claudiu.beznea@kernel.org> <20260520131206.932050-3-claudiu.beznea@kernel.org>
In-Reply-To: <20260520131206.932050-3-claudiu.beznea@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 15:17:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+Rw9PqTRRY3+YGL5hOncJMfEUaMeQhrj1VB1trFDbyg@mail.gmail.com>
X-Gm-Features: AcwNN1Vz9bqZXB4KhkMlpFM4f-6nIsbwp7DHyGg8Z1SbeCLuh5Z7l-sMB_cn8NM
Message-ID: <CAMuHMdU+Rw9PqTRRY3+YGL5hOncJMfEUaMeQhrj1VB1trFDbyg@mail.gmail.com>
Subject: Re: [PATCH 2/4] i2c: riic: Use the "dev_name:irq_name" format for the
 interrupt name
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, wsa@sang-engineering.com, 
	claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 20 May 2026 at 15:14, Claudiu Beznea <claudiu.beznea@kernel.org> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Use the "dev_name:irq_name" format for the interrupt names. This makes it
> easier to identify interrupts in systems where multiple devices may request
> interrupts with the same name.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Output looks much better now (on RZA2MEVB)

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
