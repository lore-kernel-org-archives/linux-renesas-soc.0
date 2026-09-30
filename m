Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4021B3A9013
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Sep 2026 04:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744307; cv=none; b=Viba5p3PEtXRh0SSOuxHHMC/HulFZxyREg6Ei4Js9GTIHBwAlze+9BpibXEP0Ww5XQ+Zypmt/RwTVzuHpY3oR1VxrOesGNt7Y+7TspT0d/0X77l+z8JKDb6v4vD7hsPg/bG5HqBVCfffbKdfYJ/njJ1EbBwgnTIICyDc7lGHS44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744307; c=relaxed/simple;
	bh=3oHARtxQHfsUHREzdKvVWsDAoW0EYwl+gURgFaSF9bQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JaPU6QsI2A/RlqycdvlrPW2B1Hj/1OPrI3I3HvvKVdEZ9LymFbGksUvtFLd7Toq5pGPVNwTVzFl51Lf3zCoLu6JqeVjkrWbj9ioSg4dxc2XF7sgOBtvR/GBxrKdZN0vRNqLhNxDiiNjO/KgMVDTKDyNHAM1MbpNpRtV/qGmCLss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnK/Nl82; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnK/Nl82"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b590a5b5eso1637383eec.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Sep 2026 21:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790744305; x=1791349105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K09LRjHkHWpGqpW/faBJIv1lkbOZda+wruM3qYt96kg=;
        b=JnK/Nl82iDgbSU9Ouulj//XhroR6kxMr9NMVrmkTouoroMQO1y26GG6vkw72LpePCW
         2TtSQ1esr+ZgNBii5p9pAgl9dqhAvqB/u8zMReLszsi9/1+jtNGxssh82yVAccRKe8HF
         2ryvy/rWjxGvfLaTAF6+mieqt3mW5a14RKOfdHSFlXJlyd8ZdQVmfb9orCs3VyuOp96o
         zLDkuOdTubv2c2Dw81pw2YVekkRmpQuFy1/L3WCBreyfyOQJxS634JEqDiqR5a7qYIMF
         i7c7a+7+2anu+s97g5L2nFC08W/Bk2gSjWq2akeSuUc9yNN6eVI8aPHjfKQaHlr+wMT0
         B2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744305; x=1791349105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K09LRjHkHWpGqpW/faBJIv1lkbOZda+wruM3qYt96kg=;
        b=kQUR69e7lwF2Q83dVmiF8TpY/ZxeDc9UmSnLFqseuVecFcw4Hz0icdkiQGY+SAmKW4
         34GD071o/I/BUQ5odA1OuT3loZ5NrIkMusndhO7dsD6IVfybcXUxm7mxq6ZJFyzH6GFs
         8Zzk1YgR4sro0VfXrploaJka8aL7aR12LI6YLFBQNSbEdntlB8/XxI9SxHnx7IDFeWS9
         2nlc2EpyArX8Ht/E2PfKZ2Ag7x8pXGYGHzU8uhwX1nGZ4vviMsjGkIk25yQvj/sEe0eT
         TdcW1pcAdrfRQxHDxFJjReoRDnhHCBxhUPNOKR1W5VhdRY6juuMIfRr2ZEJm/EC2nIfT
         8l+Q==
X-Forwarded-Encrypted: i=1; AKwUvBz1mhVT06m7lPZFDL/A0GovJtTliM4c1S3NgVHep0t0z9Zs0+MPmquPVSQFThGKWq2ydDYrpe+jVYIOYIxP1p+upg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK4bZkz8niSBSt2nzHohkeSKUiEdOPTGaANvNrX8cVW8zqvUzfW
	XLBNPoMy+b7jIUtMIxgGx8UInRU1g336GscAvqTXRtBwQPR21nRGdYUt
X-Gm-Gg: AYBFou10O9hSzhf64PgkfP2sibIkhOl+EbE2wSRQSP7lUQNqaLYxaWNG5zUiVTS15F4
	dez7VOJXZZKGIB5AMaAVs3NEACbJ2kGejkCOrFCaLEWtN7LfAAd42cuVRUawXW00uD8aJosUHtt
	4eaZzerawgHB9Ga7xBf+anadpMImr750VvYEj92Utvbc/WHBLSD4n8aJ7RQXdRhQ1V5N2jAY3qF
	yA1eDdvQUGXN1M18J713Ekghj7q9xaFCQYqTdWYND/3yU4XuVD2KZuuW5u07h3qbGMVoWFjEHhF
	Lw8j5IGl9WHAPPVO4Tis3KXWUtlbbYj8qfRNZ001+xZnPucoxA9V8S1Uibv5HE0oRxQtGNlHh6V
	zH3C5HPQB7YW+1S8jsTKR78HGi/gks9ga5zmvvORney66gS4LGdcPzYXXJvLeLj7V8peKBpf9Mz
	wZ8y5wLSKVzazVLsINWsvB1VHsLeZ36a2sTY8amaZdC2eks1UG0cau3cb9HNG+LzE/F4FyZbSkd
	94jnSAT/qwHZmEroKT3Y1ZgOQyb/WU265hd0AnbLtKtdbAO8Xze8iLfs+2/YNM=
X-Received: by 2002:a05:693c:20c7:20b0:34c:e77c:f92d with SMTP id 5a478bee46e88-34ce77cfa33mr437435eec.33.1790744305241;
        Tue, 29 Sep 2026 21:58:25 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:101a:5ce6:a15e:d8ca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf514b783sm571056eec.13.2026.09.29.21.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 21:58:24 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 29 Sep 2026 21:58:00 -0700
Subject: [PATCH v3 1/5] pinctrl: renesas: gpio: isolate function gpiochip
 from parent fwnode
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-rsk7203-properties-v3-1-02f84aeb8e47@gmail.com>
References: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com>
In-Reply-To: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com>
To: Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-6c14f

The sh-pfc driver registers two separate gpiochip instances: one for
real GPIOs and another for function GPIOs. Since both share the same
parent platform device, gpiolib's fallback logic causes both chips to
share the same firmware node (fwnode).

This causes ambiguity when using software nodes to describe GPIOs, as
gpiolib may apply hogs meant for one chip to the other if they share the
same node.

Explicitly set gc->fwnode to ERR_PTR(-ENODEV) for the function GPIO
chip. This satisfies gpiolib's check for an existing fwnode and prevents
it from falling back to the parent device's node, while ensuring that no
actual properties or hogs are found on the function chip unless
explicitly assigned later.

Assisted-by: LLM
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/pinctrl/renesas/gpio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
index 2293af642849..4e59dadb7364 100644
--- a/drivers/pinctrl/renesas/gpio.c
+++ b/drivers/pinctrl/renesas/gpio.c
@@ -278,6 +278,12 @@ static int gpio_function_setup(struct sh_pfc_chip *chip)
 
 	gc->request = gpio_function_request;
 
+	/*
+	 * Explicitly mask the parent's fwnode to prevent gpiolib from
+	 * reusing it for function GPIOs.
+	 */
+	gc->fwnode = ERR_PTR(-ENODEV);
+
 	gc->label = pfc->info->name;
 	gc->owner = THIS_MODULE;
 	gc->base = pfc->nr_gpio_pins;

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

