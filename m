Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44195 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbeLGVtg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 16:49:36 -0500
Date: Fri, 7 Dec 2018 22:49:32 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: thierry.reding@gmail.com, linux-pwm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: pwm: rcar: improve calculation of divider
Message-ID: <20181207214932.xckuuarcka733v7y@pengutronix.de>
References: <1544171373-29618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1544171373-29618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

while looking at the driver I noticed another patch opportunity: In
rcar_pwm_get_clock_division() there is a loop:

	for (div = 0; div <= RCAR_PWM_MAX_DIVISION; div++) {
		max = (unsigned long long)NSEC_PER_SEC * RCAR_PWM_MAX_CYCLE *
			(1 << div);
		do_div(max, clk_rate);
		if (period_ns <= max)
			break;
	}

The value of div should be calculatable without a loop. Something like:

   divider = NSEC_PER_SEC * RCAR_PWM_MAX_CYCLE;
   tmp = (unsigned long long)period_ns * clk_rate + (divider - 1);
   do_div(tmp, divider);
   div = ilog2(tmp - 1) + 1;

You might want to check if my maths are right, I didn't test.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-K�nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
