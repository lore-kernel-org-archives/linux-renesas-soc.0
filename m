Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834B73890E9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 13:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345926; cv=none; b=IP7AgTnaK4rT4UuGa8+G3plSrp07RMre+QWbuc7Ie9QeIw6i1QwvyEbvT9lj06cJYyU6RoRwf00nm8pF8CQrn0/FSqi/D3UvPlaBhRrRDWBkz7+l9jTkiuRuwqKY3jI4pdMsT1dMePFoPD4YzzFWg73cjGlPnuYZgLA962naJ4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345926; c=relaxed/simple;
	bh=aN7PzwoRswDeNnkOQyuCZq9wysxzTtTJEB2Yc5Vf5Kk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CM95rqIQpmuZ8F6Fj/fysb2iE0BH2/M4lv9YfaGYufQeDJv8Vrp5BF2tHsxP5s/rhzdY6AcUe6PzmAgaHubwqGJitCcSq/CfrZxDrd7gAq6187vY04hxonID/UKqtMG4GAwm7pNl3zsSdQZnLrUX51V754McgX26qQfOf+fpcF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-613207140bfso565381137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 06:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776345924; x=1776950724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0AmBYUqH/45CBCPeQbnBHDUTyHmh+0dwFXGNt0iJ78=;
        b=HOrcjKihhbXXvAjmZcl6ZlTMMBrD6sHJWQXKR7LIgs07dwoBtLRd+Pf144yaLIk1n6
         YlyUK1HXRBLOP++j7ukPE1FTQGhjLaiwNAuiFY1jljYAscfxdQgDIz86ZLTCQarMGsxZ
         4zF7T8K5TZNYnfDY1e8W5CCkbP8VKZTc5Io6nVVfNDO/QRtr/zPnp5/Zfg/cjYmRzmCI
         M+cN9r0xZIou7teMjYb/95ajrUqQTLeR1zAD1jRUXVt0rfprEtRVKNZNOpS95kWMf3uZ
         fnddnmicEbxY1jGcOUm0NBJgewpntvS+5zMWnPG8s3gB620p+MijOwtpoB9ytx4xA2hD
         DT9Q==
X-Gm-Message-State: AOJu0YwgRmT3yOXBBMGO0/WzDl7xQY1km4ggdLlDcSJEWlR6moc7ozaN
	nvTgm7XRV8CDFJ+QEaMsJdi5OvGzpbzicoTn/McYIvdWmt3gF8Bndc8uUOYjhf77
X-Gm-Gg: AeBDietH0eTRC0q/JQLkRKPvDFhTokyeBHNHMKReChN4XH9nT/+HrSzQmVE51xSjDHv
	OG42fYUiNlh5E63VS7ALpm2vmEc4RudtMUmzk5YKbkiqAFGnc9Y3bnFLBEvo0QRHAvYObxFQvmt
	VI/ovvWgRXEB+5oJOSk0RW3cd+t/tu8c7cfpSSVHWOCiipn2RzvAaJ5k6gqRlOuhHp5eGqCQG1h
	pVSry7WsuHWCjevaczMS+lLxVWfDqCI+bGjAdvFhaNREQ9z7WENcgfmVAx4sAutmrKHgJaU+Wd3
	XePB8K8SY6qnMJ2UuUbVIbx/SC3PLseBItplqQXwDoS84e3uVQhkR1ssXNIGY5Azr4f7hs9TIHy
	PLSnbNQFs/BYzBZKtUqm9xAPbn/LFNUYyRVjD20jOfqFp5Vldgzmj8qCj253l0fjaCdTBMjDCbX
	kPBt+gnnSu4sJjjva8nuXAgTUj99ihH8asLq5yI5uLdjR6OwD78QpJAAHiNEDiq40pKAi3uG8=
X-Received: by 2002:a05:6102:2907:b0:608:94e4:1c00 with SMTP id ada2fe7eead31-609fe7a57a0mr10282113137.2.1776345924328;
        Thu, 16 Apr 2026 06:25:24 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-612cfc0202csm2446010137.12.2026.04.16.06.25.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:25:23 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso2140008241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 06:25:23 -0700 (PDT)
X-Received: by 2002:a67:e70c:0:b0:608:186e:e92d with SMTP id
 ada2fe7eead31-60a00d339b0mr10618070137.25.1776345923681; Thu, 16 Apr 2026
 06:25:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413104240.30493-1-wsa+renesas@sang-engineering.com> <20260413104240.30493-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260413104240.30493-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Apr 2026 15:25:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXfdxHb2mEaqia5cSO6=G9P4OGeBiNnO=kcsLsLt_T1EQ@mail.gmail.com>
X-Gm-Features: AQROBzCzoS7XpN0zHJJgBrFXJNq5eOKLmCRB1fqneirJPrEs7vWxp-uvCf44dCM
Message-ID: <CAMuHMdXfdxHb2mEaqia5cSO6=G9P4OGeBiNnO=kcsLsLt_T1EQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mailbox: add sanity check for channel array
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mark Brown <broonie@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Apr 2026 at 12:42, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Fail gracefully if there is no channel array attached to the mailbox
> controller. Otherwise the later dereference will cause an OOPS which
> might not be seen because mailbox controllers might instantiate very
> early. Remove the comment explaining the obvious while here.
>
> Fixes: 2b6d83e2b8b7 ("mailbox: Introduce framework for mailbox")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
