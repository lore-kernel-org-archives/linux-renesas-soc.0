Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0723D34D3BE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2026 14:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063311; cv=none; b=YEjAIP0KiKzXnjOdUhaIt3ub/J8kVDm9l9LBI1MlBbBMwqh++FMKmnyPB5AC3bKHg114REZfwt1p90dx4NDdfNZDMizyNMX+60iREsE1hMXFcEbKapmrFDktOog2QvNl6Xm06BFKSNXozy8gWwFv23FV5xGGhyK+IJGarOqGDaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063311; c=relaxed/simple;
	bh=baHwBqrRku0dVBgM9HHXZGHdWlLRvvfzCWPsKKs9a9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ryHCaqT8eM0ml9SW9FLmeWToqXkumuOw7zwc7kbl61I8SOKUdFufeGO1b3JSp2GvPlTG/mzKqqQlqwPtfevD1kkq1KYncigqiKI3Zv3IBP8G1vnGZVRQFos317mU1IglxMZxjMoA/bU3h0Xlb2wQI0BYaHXLTWt8xpQk4O4Nfbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2022323c37so597197266b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2026 07:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787063308; x=1787668108;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZLIjthuIrGXlcqthi795B+F5PspdtZv0oAeSQHVFTME=;
        b=K3kmebRq58pB97ni+7Nz5ySXuT98LMuejr2osnVT3klQXKO3Bz7aK4l8zHMVWn01wd
         pjfkNE7ol+sDSN59ujFdK2zxuv3Ucp8KEy8S6pwMNjMkHwA/b6B5yFtSOt9Q3AD73lPD
         n0JnNKWYgtfcMBma6IYqUUPQQXFk3GdTLuXY2wU/k/0gaG4RcqstV2OmId+dlGFapCVN
         KYeuGcy813Mz0b3HTdKVH9kK5+p0yTobedH+SsknjMEkeSx+w+cLBQlC23UMYponFZWc
         BF9PMoRWrZr4U+7PNQ89GtBGMjhDaJHfHRoERvekcVdWBDcfgC1WpKGaZdD26CqeaiOz
         zF1w==
X-Forwarded-Encrypted: i=1; AHgh+Rq6y84ROfX/CNFFdCg8DT0Dz9uxsDtLvdG5WosJ5x21qZkZxY8VYqfoYi9C7nX0E++/jrxhxOoXIYTy6ATKSE4OyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsGW0X8gZpiPE2dLSVMxseClwyjZNH5YycU8QkNyCdbZ1ouQpo
	OEDmWgcCig96Dj46fdKRNF0qom7romQDepCjtUBLRSH8h9+W4EXLAOgUfdYLu2Rb4YQ=
X-Gm-Gg: AR+sD12Tr59Xhj9r1ikBppuX49kq7yG4Y3M/J21SwCdjkqCj2FMEsb0F/+8SpbK1V2X
	XrOYpSSXHgSljepIpSoel3XLQkfnty+Vjvqq43EGWdomy+Q/FKJRNRNYGYNsd3sf6qZFav0cQ7o
	sb/DT/ScfTN873KpHVBhoAd3xr7AaSe9ZpQPctcwqyQdt4L+9qZvL9SLEPYP8WlHIVD7MDaT2Zr
	/pwmZkH0vuSXyilwj3Bq1ow/d+2pFmoEY0M7L/CpLjznPy6mVn+d5JL78+1w61eSGb7LrYCjGvf
	PJmq1Zf5PU6BQnHv9Roqai3D151L9UbSSfukixVE26n8OFY1ayfAkmSVb3ptlSIAn5U1GM/q/Rf
	kL65CfFm5FGkOMTKZmaJ6Bn2U+Nd7RKdTRfuZOzbWjfoHifrwYrs+FnqfH1/I1fB+wRUQ+zvTpd
	4Pn7QvwcqOIBWfPLCJeLMnjvQimv6cKojCans+vXUsAVdo9Mm6BxZZ16jVbsj1JD/AfRWrCAw6J
	+DwEhk1SdrMBP5Utqi0J1Tkng==
X-Received: by 2002:a17:906:f759:b0:c21:9b4b:2690 with SMTP id a640c23a62f3a-c219b4b52ecmr112711366b.17.1787063307883;
        Tue, 18 Aug 2026 07:28:27 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe69cf4sm200822666b.3.2026.08.18.07.28.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 07:28:26 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69fc9f25118so4655075a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Aug 2026 07:28:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq8KMrFoB3EuA0/c5RzaOQ/S0vutaahlyK9u6fsgyTx7u9gmY93tZmK7wg3VSkGl6WiV4Qxq8nobq33kgBYmpaVdg==@vger.kernel.org
X-Received: by 2002:a05:6402:4608:b0:6a3:6b8f:94c4 with SMTP id
 4fb4d7f45d1cf-6a38a9bf8ffmr14480778a12.16.1787063305828; Tue, 18 Aug 2026
 07:28:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_64AA3EA1C81C724ED7D0A90390E677BC5205@qq.com>
In-Reply-To: <tencent_64AA3EA1C81C724ED7D0A90390E677BC5205@qq.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Aug 2026 16:28:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKCnC3RODV0sUyn=011pM68iQDFjC2-AB-OG-F5kw8rQ@mail.gmail.com>
X-Gm-Features: AcwNN1V1hV47wV6X-u_mwvW55lLkp61RRBplSHKa4nvu94V8GF4oXbguLAe_tb8
Message-ID: <CAMuHMdXKCnC3RODV0sUyn=011pM68iQDFjC2-AB-OG-F5kw8rQ@mail.gmail.com>
Subject: Re: [PATCH] thermal: rcar-thermal: fix runtime PM cleanup
To: Jiawen Liu <1298662399@qq.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jiawen,

Thanks for your patch!

On Tue, 18 Aug 2026 at 15:16, Jiawen Liu <1298662399@qq.com> wrote:
> Update rcar_thermal_probe() for the confirmed driver lifecycle defect.
>
> Keep the change limited to the concrete operation shown in the final
> patch.

Please write a better patch description.

>
> Signed-off-by: jiawen <1298662399@qq.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
