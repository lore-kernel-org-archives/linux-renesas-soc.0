Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091623E1696
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 06:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232748; cv=none; b=upWTfc19I6m8bTHhXHfcZ0aROjhpRa04fhZ4x7aq6U7DJs1IQgeRm43GTEF3VEaSFIgRAddNddujZDY6TOrDqNHp6WWQZY+ne5ifbYHMLFaCLS6MVuLBJqE5tkISYDweY3CVsCBprsSmKCLD81+PASgKzrH3rF1t0fLAQHC8H3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232748; c=relaxed/simple;
	bh=bHdqhN6Uz/ifL7Xj9yVetsOtxe4Gixkb74+2Fem2cnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdz5XIoH35mgUoQiKsEv5NIvNt1S1sACBpokxDGLZTcXPfeBc3sHuuflFwHOjK0TDkhZnGQ5Y+4JQyyC8PCyNJM4DYcz07WU99hnLbKTCMAfMR4Ph8Ad2IyR0h4Uqsl+v1gm41NPKSQ5RM4wzlAOVyevLM2b8+otRoZoOLphDmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e529da9so646949e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 23:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232732; x=1790837532;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8AcTxgfWu2jVaXC9s/SfRyP478Ly0vXbsE/VdtFyfI0=;
        b=UkqB7/Azgm6hWYMXx8MTwmMtczhmlfWqUVverriJc+At2KZQjvXa0AGY9KTij+cO0R
         r25PeIklTsSr9dOrvT04HQw+ArwYAp8etWJTo47RGjpSsxq38f+FyY8al+vpx+qQ4Qoi
         O+gaKH/wpo4NFdDdDE8+urSR/8wBmasArApoKGHGdjATV5dPdUN4d2zV9BvO6OsMkXKd
         cCTpoMnxXDgFTxRzyZslpC+RbYerTwcXYidaRCTrJVOsadMATKFPuA/EZhwOyOawlz8I
         JURgYdnM4BgL7QooOsQWvO4B136u99lqSmgcoDSWfwhfE3+0O53BPU1C+I2X1r+mkrgN
         BUQg==
X-Forwarded-Encrypted: i=1; AKwUvBzC/INi3NpYjKArCrUaoE17OMTIM7eO7Yxd1MV62g2+PKfeKeMBtHSOA05HceUxWnJa8PORPFAC2PFdjEq9y0T4mQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lIh4xu514TGD8Lr8uYyklq8vWoCD3D9V1viNBhnHvHZI5osTGJ
	EYQWXqv+BT4507QWlxnNOiR2sq3j9ziteQbmMlbBv1jQ5Elh+cKZDxVpdAuyhFKdMP8=
X-Gm-Gg: AYBFou0+tDUS3HRDsMoY9NZ6pgUaTapkFrH1luowEIuLKSdoU5eluec3JqQ06MVoH75
	qaa/uqYLigwzxHgTJSXhIbqwmLCGdO6pvbJdAotQXxTfX8KiIejCzUw+ZL7pZGtC15nj0LSUX3b
	rxvIojwDJnddlZySVzZRY6iHnG1I9Q7LjcJpRB4iVqMy3d77cJ6BjMUoQwlMvGpriRfQcFwneV4
	9w4T1X4nYUG3uQ5aGntkwFQ4Bti06Q1gsa53nuiuzew4QKheCwcLkDWXIPlsUt2vNH9h8V2825s
	WsmrYodVUkbuG6zxIcB0zf0nP+z05BOiaaWccPhdu0CVSYmOQzy3rbeklS0ztCnDij3wC/9wNMQ
	/abPMZk5pDxxqYf12RHXrldRWnYfTpj9oqCIuDJoElXbQpNKlniF+OTFdpR5/ugVlkGmyFKOxDU
	qVVuVXsSoath+clK15Ypp0LvPfjppy2Bupth9yftySJOB7kweny7RB90lP8iIBc5p24KTaKWrbT
	97CDs8EY2oWR3UXD/pjDYl25+YsYamMIEUUM1Q/0eYCfQw=
X-Received: by 2002:a05:6122:2982:b0:5c9:a60b:e5d1 with SMTP id 71dfb90a1353d-5cb0b67d570mr1018927e0c.11.1790232732427;
        Wed, 23 Sep 2026 23:52:12 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f0582b6bsm6141561e0c.18.2026.09.23.23.52.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:52:11 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5292faso782699e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2026 23:52:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByU/i5qvrqgGIcsjg/ct+eRQ6wTv23KRDn7EXKCpLcfrduQWAe7/JZroEbZyLJSGIPGXm/XSScPjmCMg8R+f2EP+A==@vger.kernel.org
X-Received: by 2002:a05:6102:3fa1:b0:79a:21f6:20fc with SMTP id
 ada2fe7eead31-7af1bb76432mr890214137.10.1790232731325; Wed, 23 Sep 2026
 23:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924010418.726980-1-oss.patchbox@gmail.com>
In-Reply-To: <20260924010418.726980-1-oss.patchbox@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Sep 2026 08:51:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVx4Ms42zU=C154kJV3CGQ1c4PaOjmBTc=8eVQge8NHCA@mail.gmail.com>
X-Gm-Features: AclHuK9x9fUPgKfTcFQFW-zdmziFaoehsLnYyUtoHh7DDWbbSEG86VZHZP8H3cA
Message-ID: <CAMuHMdVx4Ms42zU=C154kJV3CGQ1c4PaOjmBTc=8eVQge8NHCA@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: rcar: Release temporary device tree node reference
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Sept 2026 at 03:04, Yuho Choi <oss.patchbox@gmail.com> wrote:
> of_find_matching_node() returns a referenced node even when it is used
> only as a boolean test. Drop the reference right after the match check.
>
> Fixes: a115b1bd3af0 ("PCI: rcar: Add L1 link state fix into data abort hook")
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
> ---
> Changes in v2:
> - Use an explicit of_node_put() instead of __free(device_node) (Marek Vasut)
> - Switch to my oss.patchbox address

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
