Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C0B3815F3
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607486; cv=none; b=j+yQ7bYjftfy85u5ZRVwlZOjfYeLNFwh04tjw52PhNmxuKh1DYZMUez6tjqzBSxdXzKppl3/FWCmkOuzT8wWk7fMzmR8l2Tizwi0Tj05eS+mUj3f6QuZXAxXi2Yv+chEniAh3kxC317AdxVGGwY6/UTTxQ46xL5b+sKTt0e5Vtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607486; c=relaxed/simple;
	bh=8kX0FxT0c0XdEm99OaTtiONMqj8y3+3JEEfwwNtjEIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+LxINW6yip0nwxAxtauoXdko6zKnU6FgXaubFYFBzuwmLQTFVIbgnK0XdVQKU7/mxqGj8Mk75dHgdVAeIgRQ7+PzCfl1b4OpdVLr/hWX6KOHZjawfcCpznurenBrIbg8oOKVEQj4bSdpHVc3FVnq6OWlFzseqPxqG6y9/1usM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bf5370d38fso373416e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 07:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783607483; x=1784212283;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uMFlY6GWwnqihfhDQTAp9fBt5hzNfjez3iYyxDfqESc=;
        b=mqxrglCFMerYAD8habZz56xclTBRRyIwasKyEqSGurSgHJDzvSKDbAhP8v8qEQ5U+G
         Dajr0YNlrKUggvZHCb3WXPmZzk6ySl3q2KD9G+QK2n3Xeua/ih6nNGVigin62Rb6rUnh
         5yJKkaK5CzlBnwjNsUB7PStdWBVvLPXunzhqFj0zwriypPf0NbURNoXuTbB4D74Usoer
         doRdhrbHjifxfz7U4hz1Yuc34nd+c42vb3FfEh46x/iIw/CWqc4lVDYjNd6NiVa4P0gp
         GWoYe0CFJI4Hf2VYRljAZp77e4YlmcrW08dXwR5KIf6hbcxef42Vwpq/vekCtevpQIZn
         ZIpw==
X-Forwarded-Encrypted: i=1; AHgh+RrRs3Gy7zizJxxV6OAlNM7bBZo6u4SsdmP2U0mrA4gaEoMKsgivuTZWpLL6I9MD3CoydliBe1KJBF0oIzFdrTH6vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoQaAqjXJhS0Vo3Kl+iuHaptjdet2aHN7UfwQZtjAcvBN2SbkA
	mjKQbFt4QsfqJvADPSIfMZS5LAxrWAfQiCLJNHpmd6Fx3ReGntVJ4/Te5o6YcXxwZG4=
X-Gm-Gg: AfdE7cleReKVwKIW+MouuqzW+l+F0qMat4XFeqSJq2dGFWCk0LT3Ixd2F1Nv8pkLtVX
	ONJLK1smTdrlNDRdr2meqthdf8z47vEONkfcg9kofTu0HlarYn9Oh9y1qSN7C9BqZARha7l8gB8
	w3rZB8VuRwKOEjImv7V+YezGq9mRHPnNDlyZxk/zMsdLzCRXiqMuA9VF+kSS8A3jNfTaaUCBT6G
	BDAAIm9Fj53XuGK9qTe6jc9m7DOB7Z9jxpniEyS6bZLksB5STC0nCSREoQcG8FKQlbtbJpmTp/q
	uZcXHiIn7GSrseVCjvctw4BTUhSnklESBeR5/Ck0RF+pHLNPRFd0f9ECyvsnkpQFXyrMq2paz7G
	j/MXm/5gMskYNxvUg0F8JpAEEgy74+FlzDRTu/qvDoJmxYyzqWpVhfHQKAMKyE7j26A3iRuGrWv
	/gjxCSguHyxbknJ53qYyjlwTspUl6jSxr+UaKdxKnUffSkxV/8fenfVfBv/3RiVSvP
X-Received: by 2002:a05:6122:894:b0:5bd:b27c:bade with SMTP id 71dfb90a1353d-5bf75dafbd7mr4407749e0c.5.1783607483049;
        Thu, 09 Jul 2026 07:31:23 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f8a4fc2sm3540719e0c.14.2026.07.09.07.31.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 07:31:20 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5bef75a82d1so177178e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 07:31:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqN+dj8R112cOb/vcF2yU18gSnY++f0+6T6LqP7qsajjpwXheMlqnbMtpPRW0DvAQ7F+JsDyz3DHLjOFcF5OcWV1A==@vger.kernel.org
X-Received: by 2002:a05:6122:a0d:b0:5bd:aba5:3830 with SMTP id
 71dfb90a1353d-5bf75a96090mr4253746e0c.0.1783607480364; Thu, 09 Jul 2026
 07:31:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709135846.97972-1-panchuang@vivo.com> <20260709135846.97972-13-panchuang@vivo.com>
In-Reply-To: <20260709135846.97972-13-panchuang@vivo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 16:31:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUk-tVPwLUGnGt6vn8gihqg9xRsiSjJS0PV7iKnza9ppw@mail.gmail.com>
X-Gm-Features: AUfX_mzXIK_TQIUx9iyy1gZwmGbh-sXZWJSxhYiQ1ODxPdg6ExKlF9tIg1KNIS8
Message-ID: <CAMuHMdUk-tVPwLUGnGt6vn8gihqg9xRsiSjJS0PV7iKnza9ppw@mail.gmail.com>
Subject: Re: [PATCH 12/26] dmaengine: sh-rcar-dmac: Remove redundant dev_err()/dev_err_probe()
To: Pan Chuang <panchuang@vivo.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Kees Cook <kees@kernel.org>, 
	"open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, 
	"open list:ARM/RISC-V/RENESAS ARCHITECTURE" <linux-renesas-soc@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jul 2026 at 15:59, Pan Chuang <panchuang@vivo.com> wrote:
> The devm_request_threaded_irq() now automatically logs detailed error
> messages on failure. This eliminates the need for driver-specific
> dev_err() and dev_err_probe() calls that previously printed generic
> messages.
>
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
